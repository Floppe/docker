FROM python:2.7

RUN apt-get update && apt-get install -y supervisor python-subversion

COPY requirements.txt /tmp
RUN pip install --no-cache-dir -r /tmp/requirements.txt

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY dist-packages.pth /usr/local/lib/python2.7/site-packages/dist-packages.pth

VOLUME ["/trac", "/svn"]

EXPOSE 80 3690

CMD ["/usr/bin/supervisord"]
