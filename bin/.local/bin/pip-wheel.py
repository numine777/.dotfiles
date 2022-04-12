#!/usr/bin/env python
"""
pipreqs.py: run ``pip install`` iteratively over a requirements file.
"""
import boto3
import os


def upload_to_s3(dir_path):
    session = boto3.Session(region_name="us-east-1")
    s3 = session.resource("s3")
    bucket = s3.Bucket("pypi.dev.themel.io")

    for subdir, dirs, files in os.walk(dir_path):
        for file in files:
            full_path = os.path.join(subdir, file)
            with open(full_path, 'rb') as data:
                bucket.put_object(Key=f"__new_packages/{full_path[len(dir_path)+1:]}", Body=data)
    
def main(argv):
    try:
        filename = argv.pop(0)
    except IndexError:
        print("usage: pipreqs.py REQ_FILE [PIP_ARGS]")
    else:
        import pip
        retcode = 0
        with open(filename, 'r') as f:
            for line in f:
                if "==" in line.strip():
                    req = line.strip()
                    wheel_dir =f"/tmp/{req.split('==')[0]}" 
                    pipcode = pip.main(['wheel', req, f"--wheel-dir={wheel_dir}"])
                    upload_to_s3(wheel_dir)
                    retcode = retcode or pipcode
        return retcode
if __name__ == '__main__':
    import sys
    sys.exit(main(sys.argv[1:]))
