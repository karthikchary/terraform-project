resource "aws_elastic_beanstalk_environment" "vprofile-bean-prod" {
    application = aws_elastic_beanstalk_application.vprofile-prod
    name        = "vprofile-bean-prod"
    solution_stack_name = "64bit Amazon Linux 2 v4.1.1 running Tomcat 8.5 Corretto 11"
    cname_prefix = "vprofile-bean-prod-domain"
    setting {
        namespace = "aws:ec2:vpc"
        name = "VPCId"
        value = module.vpc.vpc_id
    }
    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name = "IamInstanceProfile"
        value = "aws-aws_elasticbeanstalk-ec2-role"
    }
    setting {
        namespace = "aws:ec2:vpc"
        name = "AssociatePublicIpAddress"
        value = "false"
    }
    setting {
        namespace = "aws:ec2:vpc"
        name = "Subnets"
        value = join(",", [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]])
    }
    setting {
        namespace = "aws:ec2:vpc"
        name = "ELBSubnets"
        value = join(",", [module.vpc.public_subnets[0], module.vpc.public_subnets[1], module.vpc.public_subnets[2]])
    }
    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name = "InstanceType"
        value = "t2.micro"
    }
}