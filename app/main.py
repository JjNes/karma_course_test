import os
import uuid
import time
from fastapi import FastAPI


app = FastAPI()


@app.get("/")
async def root():
    return {
        "hostname": os.uname()[1],
        "time": time.time(),
        "uuid": uuid.uuid4()
    }
