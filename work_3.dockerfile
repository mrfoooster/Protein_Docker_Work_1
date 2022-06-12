FROM python:3
WORKDIR /app
COPY . .
RUN echo "installig"
CMD ["node", "src/index.html"]
EXPOSE 3000 
