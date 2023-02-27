FROM continuumio/miniconda3
COPY ./app 
WORKDIR "/app"
RUN conda install --file /tmp/requirements.txt
ENTRYPOINT [ "python3" ]
CMD [ "dashboard.py" ]
