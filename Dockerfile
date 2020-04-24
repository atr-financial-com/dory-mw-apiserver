FROM docker.financial.com/ops/fcom-service-base:latest

COPY result/ /
RUN chown apiserver:apiserver -R /var/financial.com/apiserver
USER apiserver:apiserver
WORKDIR /var/financial.com/apiserver
ENV HEAP_SIZE=256M SERVICE_PORT=20099 SERVICE_TIMEOUT=5 SERVICE=apiserver
EXPOSE $SERVICE_PORT
CMD ["com.financial.apiserver.ApiServer"]