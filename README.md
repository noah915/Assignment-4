# Assignment #4: Application Containerization

This is a simple Node.js web application designed for learning Docker containerization concepts.

## Application Overview

This application is a basic Express.js web server that:
- Serves a static HTML page at the root (`/`)
- Provides an API status endpoint at `/api/status`
- Includes a health check endpoint at `/health`
- Runs on port 3000 by default (configurable via PORT environment variable)

## What's Included

- **app.js**: Main application server file
- **package.json**: Node.js dependencies and project configuration
- **public/index.html**: Static HTML page that confirms successful containerization
- **public/style.css**: Styling for the web page

## Running Without Docker (for reference only)

If you wanted to run this application directly (not required for assignment):
```bash
npm install
npm start
```

## Your Docker Assignment

**DO NOT MODIFY THE APPLICATION CODE**

Your task is to containerize this existing application using Docker. You need to:

1. Create a `Dockerfile` that properly containerizes this Node.js application
2. Build a Docker image from your Dockerfile
3. Run a container from your image
4. Verify the application works by accessing it in your browser

## Starting the Application

- To build the docker image run the command:

```bash
docker build -t docker-demo-app .
```

- To run your docker container in port 3000 run the command:

```bash
docker run -d -p 3000:3000 --name docker-demo-app docker-demo-app
```

## Reflection Question
**Answer the following question in the space below**: How does containerization with Docker differ from using virtual machines, and why might a development team choose Docker containers over VMs for deploying applications like the one you just containerized?


Reflection answer:

Containers vs Virtual Machines (high level):

- Architecture: Virtual machines (VMs) run full guest operating systems on top of a hypervisor; each VM includes a separate OS kernel, system libraries, and the application. Docker containers package the application and its dependencies but share the host OS kernel, using lightweight isolation provided by the OS (namespaces, cgroups).
- Startup time and resource use: Containers are much smaller and start in milliseconds to seconds because they don't boot an OS; VMs typically take longer and consume more memory and storage because each VM includes a full OS image.
- Portability and consistency: Containers produce portable images that run the same way on any host with a compatible container runtime, helping eliminate "works on my machine" problems. VMs are portable too but heavier to move and deploy.

Why a team might choose Docker containers over VMs for this app:

- Faster iterations: Developers can build, run, and tear down containers quickly during development and CI pipelines.
- Better resource efficiency: You can run many more container instances on the same host compared to VMs, lowering infrastructure cost for scaling microservices or multiple dev environments.
- Consistent runtime: Container images lock the application runtime and dependencies, reducing configuration drift between dev, test, and production.
- Easier CI/CD and orchestration: Containers integrate well with modern CI systems and orchestration platforms (Docker Compose, Kubernetes) for automated testing, rollout, and scaling.

Trade-offs and considerations:

- Isolation: Containers share the host kernel, so they provide weaker isolation than VMs; for multi-tenant or highly sensitive workloads, VMs (or additional hardening) may be preferable.
- Operational complexity: Running containers at scale benefits from orchestration (Kubernetes) which adds complexity compared to managing a small set of VMs.
- Security and compatibility: Containers require attention to image provenance, vulnerabilities, and kernel compatibility across hosts.

In summary: For an application like this Node.js web app, Docker containers are a good fit because they provide fast startup, portability, and resource-efficient deployment—making development, testing, and scaling simpler and faster than traditional VM-based approaches in most cases.

Screenshots:

After you build and run your container, visit `http://localhost:3000` and `http://localhost:3000/api/status`. Take screenshots of both pages and add them to the repository (for example, a `screenshots/` folder). Then commit and push the images to GitHub.



## Application Requirements for Docker

Your Dockerfile should ensure:
- The application has Node.js runtime available
- All application files are copied into the container
- Dependencies are installed (`npm install`)
- Port 3000 is exposed
- The application starts with `npm start`
- The container can be accessed from your host machine

## Verification

When your Docker container is running correctly:
- Navigate to `http://localhost:3000` (or whatever port you mapped)
- You should see a success page confirming containerization worked
- The `/api/status` endpoint should return JSON status information

## Troubleshooting Tips

- Make sure your port mapping is correct in the `docker run` command
- Check that all files are copied into the container
- Verify Node.js dependencies are installed in the container
- Use `docker logs <container-name>` to see application output

## File Structure Expected
```
docker-assignment/
├── Dockerfile          # You create this
├── app.js              # Provided
├── package.json        # Provided
├── public/             # Provided
│   ├── index.html      # Provided
│   └── style.css       # Provided
└── README.md           # This file
```

Good luck with your Docker containerization!