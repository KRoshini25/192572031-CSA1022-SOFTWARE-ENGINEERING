# CSA10 – Software Engineering | Model Practical Set 5

This repository contains files for all four questions in Set 5.

## Folder structure
- `Q1_GCD_LCM/` – Euclid algorithm, RAPTOR flowchart reference and sample outputs.
- `Q2_Online_Banking_UML/` – UML class diagram and design notes.
- `Q3_Docker_Notes_App/` – Node.js Express Notes application, Dockerfile and Docker instructions.
- `Q4_Git_Signup/` – Signup function and Git branch commands.

## Run the Notes application with Docker
Open a terminal in `Q3_Docker_Notes_App` and run:

```bash
docker build -t notes-app .
docker run -d -p 3000:3000 --name notes-container notes-app
```

Open `http://localhost:3000`. The page includes a simple form to add notes and display the list.

Test the API:
```bash
curl http://localhost:3000/notes
curl -X POST http://localhost:3000/notes -H "Content-Type: application/json" -d "{\"note\":\"My first note\"}"
```

Push to Docker Hub after logging in:
```bash
docker login
docker tag notes-app YOUR_DOCKERHUB_USERNAME/notes-app:1.0
docker push YOUR_DOCKERHUB_USERNAME/notes-app:1.0
```

Replace `YOUR_DOCKERHUB_USERNAME` with your Docker Hub username.

## Important about screenshots
The PNG files in the screenshots folders are **reference/design previews**, not proof that commands were run on your computer. After running RAPTOR, StarUML and Docker locally, take your own screenshots and add them to the relevant folder before submission.
