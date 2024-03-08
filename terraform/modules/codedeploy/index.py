import boto3
import os

def lambda_handler(event, context):
    cloudfront_client = boto3.client('cloudfront')
    codepipeline_client = boto3.client('codepipeline')
    
    try:
        job_id = event['CodePipeline.job']['id']
    except KeyError:
        job_id = None

    distribution_id = os.environ['DISTRIBUTION_ID']
    paths = ['/*']
    
    try:
        invalidation = cloudfront_client.create_invalidation(
            DistributionId=distribution_id,
            InvalidationBatch={
                'Paths': {
                    'Quantity': len(paths),
                    'Items': paths
                },
                'CallerReference': str(context.aws_request_id)
            }
        )
        
        if job_id:
            codepipeline_client.put_job_success_result(jobId=job_id)
        
        return str(invalidation)
    
    except Exception as e:
        if job_id:
            codepipeline_client.put_job_failure_result(
                jobId=job_id,
                failureDetails={
                    'message': str(e),
                    'type': 'JobFailed'
                }
            )
        raise
