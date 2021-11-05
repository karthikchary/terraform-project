resource "aws_elastic_beanstalk_application" "vprofile-prod" {
    name = "vprofile-prod"
    description = "vprofile-prod"
    # application_version_lifecycle {
    #     delete_source_from_s3 = true
    # }
}