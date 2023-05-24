resource "aws_s3_bucket" "s3test" {
  bucket = "s3testtrheg"

  tags = {
    Name        = "s3testtrheg"
    Environment = "Dev"
  }
}
