# Q3 – Dockerize Node.js Express Notes Application

## Run locally
```bash
npm install
npm start
```
Open `http://localhost:3000`.

## Build and run with Docker
```bash
docker build -t notes-app .
docker run -d --name notes-container -p 3000:3000 notes-app
```

## Test API
```bash
curl http://localhost:3000/notes
curl -X POST http://localhost:3000/notes -H "Content-Type: application/json" -d "{\"note\":\"Finish practical record\"}"
curl http://localhost:3000/notes
```

## Push to Docker Hub
```bash
docker login
docker tag notes-app YOUR_DOCKERHUB_USERNAME/notes-app:1.0
docker push YOUR_DOCKERHUB_USERNAME/notes-app:1.0
```

## Dockerfile explanation
- `FROM`: selects the Node.js base image.
- `WORKDIR`: sets the working directory inside the image.
- `COPY package*.json`: copies dependency manifest files.
- `RUN npm install --omit=dev`: installs production dependencies.
- `COPY app.js index.html`: copies application files.
- `EXPOSE 3000`: documents the application port.
- `CMD`: starts the Express server.

`.dockerignore` prevents unnecessary files such as `node_modules`, Git metadata and screenshots from being copied into the build context. Notes are stored in memory in this simple exercise, so they reset when the container/application restarts. Use a database or mounted volume for persistent storage.
