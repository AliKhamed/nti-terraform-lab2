resource "aws_sns_topic" "cpu_alert_topic" {
  name = "cpu_alert_topic"
}

data "aws_iam_policy_document" "cloudwatch_to_sns" {
  statement {
    actions   = ["sns:Publish"]
    resources = [aws_sns_topic.cpu_alert_topic.arn]
  }
}

resource "aws_iam_policy" "cloudwatch_to_sns" {
  name        = "cloudwatch_to_sns"
  description = "Allow CloudWatch to publish to SNS"
  policy      = data.aws_iam_policy_document.cloudwatch_to_sns.json
}

resource "aws_iam_role" "cloudwatch_to_sns_role" {
  name = "cloudwatch_to_sns_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "cloudwatch.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })

  inline_policy {
    name   = "cloudwatch_to_sns_policy"
    policy = aws_iam_policy.cloudwatch_to_sns.policy
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_alarm" {
  alarm_name          = "cpu_utilization_alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300 // 5 minutes
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Alarm when CPU exceeds 70% threshold"
  alarm_actions       = [aws_sns_topic.cpu_alert_topic.arn]

  dimensions = {
    InstanceId = aws_instance.ec2.id
  }

  tags = {
    Name = "CPUUtilizationAlarm"
  }
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.cpu_alert_topic.arn
  protocol  = "email"
  endpoint  = "alikhames566@gmail.com"
}