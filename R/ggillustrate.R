#' Transform a ggplot2 Chart into an Artistic Illustration via OpenAI
#'
#' Given a \code{ggplot2} plot and a set of visual themes, \code{gg_illustrate()} sends the
#' saved plot to the OpenAI Image Editing endpoint. The function requests an AI-generated
#' illustration that preserves the original data structure, legends, labels, and relationships,
#' while applying aesthetic enhancements inspired by the specified themes.
#'
#' @param plot (\code{ggplot})\cr
#'   A \code{ggplot2} object to be transformed.
#' @param themes (\code{character(1)})\cr
#'   A comma-separated string of visual themes or keywords (e.g., "watercolor, minimal, geometric").
#'   These themes guide the artistic style of the final image.
#' @param out_path (\code{character(1)})\cr
#'   Local file path where the AI-generated PNG will be saved. Defaults to "ai_illustration.png".
#' @param size (\code{character(1)})\cr
#'   Requested size for the output PNG (e.g., "1024x1024", "512x512", "256x256").
#'   Must match OpenAI's supported image sizes.
#' @param openai_api_key (\code{character(1)})\cr
#'   Optional. Explicit OpenAI API key to use. If \code{NULL}, the function tries to read
#'   from the environment variable \env{OPENAI_API_KEY}.
#'
#' @details
#'   1. The function temporarily saves the input \code{ggplot2} object as a PNG (300 DPI, 6"x4").
#'   2. It constructs a prompt that requests the AI to keep the data, legends, and labels unchanged
#'      while blending in the user-defined visual themes.
#'   3. It calls OpenAI's \code{/v1/images/edits} endpoint, specifying \code{model = "gpt-image-1"}.
#'   4. On success (HTTP 200), the returned base64-encoded PNG is decoded and written to \code{out_path}.
#'
#' @return
#'   Invisibly returns the path to the saved illustration (\code{out_path}).
#'   Throws an error if the OpenAI API key is missing or the API call fails.
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' p <- ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
#' gg_illustrate(
#'   plot = p,
#'   themes = "watercolor, minimal, pastel",
#'   out_path = "mtcars_artistic.png",
#'   size = "512x512"
#' )
#' }
#'
#' @import httr
#' @import jsonlite
#' @import base64enc
#' @importFrom ggplot2 ggsave
#' @export


gg_illustrate <- function(plot,
                          themes,
                          out_path = "ai_illustration.png",
                          size = "1024x1024",
                          openai_api_key = NULL) {
  if (!requireNamespace("httr", quietly = TRUE)) install.packages("httr")
  if (!requireNamespace("jsonlite", quietly = TRUE)) install.packages("jsonlite")
  if (!requireNamespace("base64enc", quietly = TRUE)) install.packages("base64enc")

  library(httr)
  library(jsonlite)
  library(base64enc)

  # Get API key
  api_key <- openai_api_key %||% Sys.getenv("OPENAI_API_KEY")
  if (api_key == "") {
    stop("OpenAI API key not provided.")
  }

  # Save ggplot to PNG
  temp_plot_path <- tempfile(fileext = ".png")
  ggplot2::ggsave(filename = temp_plot_path, plot = plot, width = 6, height = 4, dpi = 300)

  # Prompt
  prompt <- sprintf(
    "Transform the provided chart into an artistic illustration that maintains the original EXACT data structure, EXACT legends, labels and relationships. Incorporate visual elements inspired by the following themes: %s. Ensure the resulting image is both aesthetically pleasing and faithful to the underlying data.",
    themes
  )

  # API Call
  response <- POST(
    url = "https://api.openai.com/v1/images/edits",
    add_headers(Authorization = paste("Bearer", api_key)),
    body = list(
      model = "gpt-image-1",
      image = upload_file(temp_plot_path),
      prompt = prompt,
      size = size
    ),
    encode = "multipart"
  )

  if (status_code(response) != 200) {
    stop("API error: ", content(response, "text", encoding = "UTF-8"))
  }

  # Extract base64 image
  b64_image <- content(response)$data[[1]]$b64_json
  image_bin <- base64decode(b64_image)
  writeBin(image_bin, out_path)

  message("✅ AI-enhanced image saved to: ", out_path)
}
