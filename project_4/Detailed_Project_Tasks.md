<h1 id="project-tasks">Project Tasks</h1>
<p>Assuming you have a terminal window open, you’re in the project directory, and your <code>.devops</code> environment is activated, you can continue viewing and editing project files! </p>
<blockquote>
<p>This section is quite dense and so, it is suggested that you approach one <strong>task</strong> at a time, carefully reading through the instructions and completing the task, then taking a break if you desire, and coming back to the <em>next</em> task. </p>
</blockquote>
<hr>
<h2 id="task-1-complete-the-dockerfile">Task 1: Complete the Dockerfile</h2>
<p>Docker can build images automatically by reading the instructions from a <code>Dockerfile</code>. The Dockerfile contains all the commands a user could call on the command line to assemble an image. </p>
<p>To view the contents of the <code>Dockerfile</code> type: <code>cat Dockerfile</code>. You can edit any file by opening it in a text editor and saving it.</p>
<h3 id="dockerfile"><code>Dockerfile</code></h3>
<p>You can see that you have been given a couple of lines of code in the <code>Dockerfile</code> and some instructions.</p>
<p><code>FROM</code> is provided for you; the FROM instruction initializes a new build stage and sets the <strong>base image</strong> for subsequent instructions. In this case, it specifies Python3 as the base image for this application. The rest of the <code>Dockerfile</code> instructions are left for you to complete. You should have instructions that:</p>
<ul>
<li>Specify a working directory.</li>
<li>Copy the <code>app.py</code> source code to that directory</li>
<li>Install any dependencies in <code>requirements.txt</code> (do not delete the commented <code># hadolint ignore</code> statement).</li>
<li>Expose a port when the container is created; port 80 is standard.</li>
<li>Specify that the app runs at container launch.</li>
</ul>
<p>After you complete this file and save it, it is recommended that you go back to your terminal and run <code>make lint</code> again to see if <code>hadolint</code> catches any errors in your Dockerfile. <strong>You are required to pass these lint checks to pass the project.</strong></p>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><hr>
<h2 id="task-2-run-a-container-make-a-prediction">Task 2: Run a Container &amp; Make a Prediction</h2>
<p>In order to run a containerized application, you’ll need to build and run the docker image that you defined in the <code>Dockerfile</code>, and then you should be able to test your application, locally, by having the containerized application accept some input data and produce a prediction about housing prices.
<code>run_docker.sh</code></p>
<p>Next, open and complete the file, <code>run_docker.sh</code> to be able to get Docker running, locally.</p>
<p>Within <code>run_docker.sh</code>, complete the following steps:</p>
<ul>
<li>Build the docker image from the Dockerfile; it is recommended that you use an optional <code>--tag</code> parameter as described in the <a target="_blank" href="https://docs.docker.com/engine/reference/commandline/build/">build documentation</a>.</li>
<li>List the created docker images (for logging purposes).</li>
<li>Run the containerized Flask app; publish the container’s port to a host port. <strong>The appropriate container and host ports are in the Dockerfile and <code>make_prediction.sh</code> files, respectively.</strong></li>
</ul>
<p>You can find a list of all the docker commands you might need to use in the <a target="_blank" href="https://docs.docker.com/engine/reference/commandline/docker/">documentation</a>.</p>
<h3 id="running-the-complete-script">Running the complete script</h3>
<p>This file is a <strong>shell script</strong> which you can see from the extension <code>.sh</code>. To <em>run</em> a shell script from your terminal, you type <code>./&lt;scriptname&gt;</code>. </p>
<p>To run and build a docker image, you’ll type <code>./run_docker.sh</code>. After typing this command, you should see something like the following in your terminal, followed by a number of build steps:</p>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div><div role="button" tabindex="0" aria-label="Show Image Fullscreen" class="image-atom--image-atom--1XDdu"><div class="image-atom-content--CDPca"><div class="image-and-annotations-container--1U01s"><img class="image--26lOQ" src="https://video.udacity-data.com/topher/2019/May/5cda1e18_screen-shot-2019-05-13-at-6.46.55-pm/screen-shot-2019-05-13-at-6.46.55-pm.png" alt="run docker script" width="500px"></div></div></div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><p>After a brief waiting period, you should see messages indicating a successful build, along with some indications that your app is being served on port 80 (also, a warning about the development server is to be expected, here).</p>
<pre><code class="lang-bash">Successfully built &lt;build id&gt;
Successfully tagged &lt;your tag&gt;
</code></pre>
<p>This indicates a successful build and <strong>if you keep this application running</strong> you can make predictions!</p>
<h3 id="making-predictions">Making predictions</h3>
<p>Then, to make a prediction, you have to open a <strong>separate tab or terminal window</strong>. In this new window, navigate to the main project directory (some computers will do this automatically) and call <code>./make_prediction.sh</code>.</p>
<p>This shell script is responsible for sending some input data to your containerized application via the appropriate port. Each numerical value in here represents some feature that is important for determining the price of a house in Boston. The source code is responsible for passing that data through a trained, machine learning model, and giving back a predicted value for the house price. </p>
<p>In the prediction window, you should see the value of the prediction, and in your main window, where it indicates that your application is running, you should see some log statements print out. You’ll see that it prints out the input payload at multiple steps; when it is JSON and when it’s been converted to a DataFrame and about to be scaled. </p>
<p><strong>After making a prediction, you can type <code>CTRL+C</code> (+enter) to quit running your application.</strong> You can always re-run it with a call to <code>./run_docker.sh</code>.</p>
<p>Your next task will be to add a log statement in <code>app.py</code> that prints out the pre-trained model <strong>prediction</strong> as Log.info. </p>
<p>The complete text output from these logs will be submitted as part of the complete project. </p>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><hr>
<h2 id="task-3-improve-logging-save-output">Task 3: Improve Logging &amp; Save Output</h2>
<p>Logging is an important part of debugging and understandability. Many times, logs will be how engineers figure out what an app is doing as it processes some input. In this case, <code>app.py</code> is responsible for </p>
<ol>
<li>Accepting an input JSON payload, and converting that into a DataFrame.</li>
<li>Scaling the DataFrame payload.</li>
<li>Passing the scaled data to a pre-trained model and getting back a prediction.</li>
</ol>
<p>So far, the logs print out the JSON and DataFrame payloads, but do not have any statements for the scaled input or the resultant prediction. The prediction is an especially important piece of information and so you definitely want that value in the logs. </p>
<h3 id="add-a-prediction-log-statement">Add a prediction log statement</h3>
<p>Your task is to <strong>add at least one log statement to <code>app.py</code> that prints out the output <code>prediction</code> values</strong>. You can add more log statements than that, but that is what is required. </p>
<p>Once you have updated your <code>app.py</code> code, save it and <code>./run_docker.sh</code> again and make the same prediction in a separate terminal window. </p>
<h3 id="create-docker_out-txt">Create <code>docker_out.txt</code></h3>
<p><strong>Copy and paste this terminal output, which has log info, in a text file <code>docker_out.txt</code>.</strong> A sample output is shown below. </p>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div><div role="button" tabindex="0" aria-label="Show Image Fullscreen" class="image-atom--image-atom--1XDdu"><div class="image-atom-content--CDPca"><div class="image-and-annotations-container--1U01s"><img class="image--26lOQ" src="https://video.udacity-data.com/topher/2019/May/5cda1f8f_screen-shot-2019-05-13-at-6.52.55-pm/screen-shot-2019-05-13-at-6.52.55-pm.png" alt="" width="600px"></div><div class="caption--2IK-Y"><div class="index-module--markdown--2MdcR ureact-markdown "><p>Sample log output</p>
</div></div></div></div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><p>The <code>docker_out.txt</code> file should include all your log statements plus a line that reads something like <code>”POST /predict HTTP/1.1” 200 -</code> The 200 is a standard value indicating the good “health” of an interaction. <strong>The <code>docker_out.txt</code> file will be one of two, log output files that will be part of a passing, project submission.</strong></p>
<p>Again, after making a prediction, you can type <code>CTRL+C</code> (+enter) to quit running your application. You’ll need to quit running before you can move on to the next steps and upload the built, docker image.</p>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><hr>
<h2 id="task-4-upload-the-docker-image">Task 4: Upload the Docker Image</h2>
<p>Now that you’ve tested your containerized image locally, you’ll want to upload your built image to docker. This will make it accessible to a Kubernets cluster. </p>
<h3 id="upload-your-docker-image">Upload your Docker image</h3>
<p>To upload an image to docker, you’ll need to complete the <code>upload_docker.sh</code> file:</p>
<ul>
<li>Define a <code>dockerpath</code> which will be “<your docker="" id="">/path”; the path may be the same as the build tag you created in <code>run_docker.sh</code> or just some descriptive path name. Recall that your docker username is your unique docker ID.</your></li>
<li>Authenticate and tag   image; this step is responsible for creating a login step and ensuring that the uploaded docker image is tagged descriptively.</li>
<li>Similar to how you might push a change to a Github repository, push your docker image to the <code>dockerpath</code> defined in step 1. This push may take a moment to complete.</li>
</ul>
<p>Assuming you’ve already built the docker image with <code>./run_docker.sh</code>, you can now upload the image by calling the complete shell script <code>./upload_docker.sh</code>. </p>
<p>If you’ve successfully implemented authentication and tagging, you should see a successful login statement and a repository name that you specified, printed in your terminal. You should also be able to see your image as a repository in your <a target="_blank" href="https://hub.docker.com/">docker hub account</a>.</p>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><hr>
<h2 id="task-5-configure-kubernetes-to-run-locally">Task 5: Configure Kubernetes to Run Locally</h2>
<p>You should have a virtual machine like VirtualBox and <code>minikube</code> installed, as per the project environmet instructions. To start a local cluster, type the terminal command: <code>minikube start</code>.</p>
<p><strong>After minikube starts, a cluster should be running locally.</strong> You can check that you have one cluster running by typing <code>kubectl config view</code> where you should see at least one cluster with a <code>certificate-authority</code> and <code>server</code>. </p>
<p>This is a short task, but it may take some time to configure Kubernetes, and so this deserves its own task number.</p>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><hr>
<h2 id="task-6-deploy-with-kubernetes-and-save-output-logs">Task 6: Deploy with Kubernetes and Save Output Logs</h2>
<p>Now that you’ve uploaded a docker image and configured Kubernetes so that a cluster is running, you’ll be able to deploy your application on the Kubernetes cluster. This involves running your containerized application using <code>kubectl</code>, which is a command line interface for interacting with Kubernetes clusters.</p>
<h3 id="run_kubernetes-sh"><code>run_kubernetes.sh</code></h3>
<p>To deploy this application using <code>kubectl</code>, open and complete the file, <code>run_kubernetes.sh</code>:</p>
<p>The steps will be somewhat similar to what you did in both <code>run_docker.sh</code> and <code>upload_docker.sh</code> but specific to kubernetes clusters. Within <code>run_kubernetes.sh</code>, complete the following steps:</p>
<ul>
<li>Define a <code>dockerpath</code> which will be “<your docker="" id="">/path”, this should be the same name as your uploaded repository (the same as in <code>upload_docker.sh</code>)</your></li>
<li>Run the docker container with <code>kubectl</code>; you’ll have to specify the container and the port</li>
<li>List the kubernetes pods</li>
<li>Forward the container port to a host port, using the same ports as before</li>
</ul>
<p>After completing the code, call the script <code>./run_kubernetes.sh</code>. This assumes you have a local cluster configured and running. This script should create a pod with a name you specify and you may get an initial output that looks as follows, with a cluster and status:</p>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div><div role="button" tabindex="0" aria-label="Show Image Fullscreen" class="image-atom--image-atom--1XDdu"><div class="image-atom-content--CDPca"><div class="image-and-annotations-container--1U01s"><img class="image--26lOQ" src="https://video.udacity-data.com/topher/2019/May/5cda213f_screen-shot-2019-05-13-at-7.00.20-pm/screen-shot-2019-05-13-at-7.00.20-pm.png" alt="" width="500px"></div><div class="caption--2IK-Y"><div class="index-module--markdown--2MdcR ureact-markdown "><p>Pending pod</p>
</div></div></div></div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><p>Initially, your pod may be in the process of being created, as indicated by <code>STATUS: ContainerCreating</code>, but you just have to wait a few minutes until the pod is ready, then you can run the script again.</p>
<p><strong>Waiting: </strong> You can check on your pod’s status with a call to <code>kubectl get pod</code> and you should see the status change to <code>Running</code>. Then you can run the full <code>./run_kuberenets.sh</code> script again.</p>
<h3 id="make-a-prediction">Make a prediction</h3>
<p>After you’ve called <code>run_kubernetes.sh</code>, and a pod is up and running, make a prediction using a <em>separate</em> terminal tab, and a call to <code>./make_prediction.sh</code>, as you did before.</p>
<h3 id="kubernetes-out-txt"><code>kubernetes.out.txt</code></h3>
<p>After running a prediction via Kubernetes deployment, what do you see in your main terminal window?</p>
<p><strong>Copy the text output after calling <code>run_kubernetes.sh</code> and paste it into a file <code>kubernetes_out.txt</code>.</strong> This will be the second (out of two) text files that are required for submission. This output might look quite different from <code>docker_out.txt</code>; this new file should include your pod’s name and status, as well as the port forwarding and handling text.</p>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><hr>
<h2 id="task-7-important-delete-cluster">Task 7: [Important] Delete Cluster</h2>
<p>After you’re done deploying your containerized application and making test predictions via Kubernetes cluster, you should clean up your resources and <strong>delete the kubernetes cluster</strong> with a call to <code>minikube delete</code>.</p>
<p> You can also pause your work and save the cluster state with a call to <code>minikube stop</code>. </p>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><hr>
<h2 id="almost-ready-for-project-submission">Almost Ready for Project Submission</h2>
<p>Now, you are almost ready to submit your project! </p>
<ul>
<li>Check that you have all complete files</li>
<li>Push your work to a Github repository</li>
<li>One last step: <strong>CircleCI Integration</strong></li>
</ul>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><hr>
<h2 id="task-8-circleci-integration">Task 8: CircleCI Integration</h2>
<p>CircleCI is a tool that defines an automated <strong>testing environment</strong>; getting a CircleCI <em>badge</em> that reads "Passed" on a repository indicates that the project code has passed all lint tests. CircleCI uses a YAML file to identify how you want your testing environment set up and what tests you want to run. On CircleCI 2.0, this file must be called <code>config.yml</code> and must be in a hidden folder called <code>.circleci</code>. On Mac, Linux, and Windows systems, files and folders whose names start with a period are treated as system files that are hidden from users by default.</p>
<ul>
<li><p>To create the file and folder on GitHub, click the <code>Create new file</code> button on the repo page and type <code>.circleci/config.yml</code>. You should now have in front of you a blank <code>config.yml</code> file in a <code>.circleci</code> folder.</p>
</li>
<li><p>Then you can paste the text from <a target="_blank" href="https://s3.amazonaws.com/video.udacity-data.com/topher/2019/May/5cda0d76_config/config.yml">this yaml file</a> into your file, and commit the change to your repository.</p>
</li>
<li><p>It may help to reference <a target="_blank" href="https://circleci.com/blog/triggering-trusted-ci-jobs-on-untrusted-forks/">this CircleCI blog post</a> on Github integration.</p>
</li>
</ul>
<h3 id="setting-up-and-building-a-project">Setting up and Building  a Project</h3>
<p>To test your repository with CircleCI, you will need a CircleCI account, which you can get via their <a target="_blank" href="https://circleci.com/signup">signup page</a> + clicking "Start with GitHub." Once you have an account, you'll be able to build project using the CircleCI <a target="_blank" href="https://circleci.com/dashboard">dashboard</a>. </p>
<p>On the dashboard, you will be given the option to set up a new project. To add your new repo, ensure that your GitHub account is selected in the dropdown menu in the upper-left, find the project repository that you've created, and click the <code>Setup project</code> button next to it. You can leave all set up configurations as their default value then click <code>Start building</code>. </p>
<p>You should see your build start to run, and if your project passes the lint tests, you'll see that the project passes!</p>
<ul>
<li>You can then add a <a target="_blank" href="https://circleci.com/docs/2.0/status-badges/">status badge</a> indicating that your project has "Passed" CircleCI tests, by looking at the markdown in the Notifications section of your project’s settings &gt; Status Badges.</li>
<li>Best practice is to add the badge via markdown into the Github project's README.md file.</li>
</ul>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div><div role="button" tabindex="0" aria-label="Show Image Fullscreen" class="image-atom--image-atom--1XDdu"><div class="image-atom-content--CDPca"><div class="image-and-annotations-container--1U01s"><img class="image--26lOQ" src="https://video.udacity-data.com/topher/2019/May/5cda259e_screen-shot-2019-05-13-at-7.19.00-pm/screen-shot-2019-05-13-at-7.19.00-pm.png" alt="passed status badge" width="120px"></div></div></div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><hr>
<h2 id="task-9-readme-md">Task 9: README.md</h2>
<p>A complete README file should include:</p>
<ol>
<li>A summary of the project</li>
<li>Instructions on how to run the Python scripts and web app (simply listing command line calls will suffice), and</li>
<li>A short explanation of the files in the repository.  </li>
</ol>
<p>The README should also include the "passed" status badge (shown above) at the <strong>top</strong> of the README.</p>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><hr>
