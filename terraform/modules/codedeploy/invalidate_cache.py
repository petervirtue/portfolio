import boto3
import os

def lambda_handler(event, context):
    distribution_id = os.environ['DISTRIBUTION_ID']
    paths = ['/*']
    
    client = boto3.client('cloudfront')
    invalidation = client.create_invalidation(
        DistributionId=distribution_id,
        InvalidationBatch={
            'Paths': {
                'Quantity': len(paths),
                'Items': paths
            },
            'CallerReference': str(context.aws_request_id)
        }
    )
    return invalidation
