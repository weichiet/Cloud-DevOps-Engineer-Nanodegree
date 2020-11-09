<h1 id="create-and-activate-an-environment">Create and activate an environment</h1>
<p>All of these instructions are to be completed via a terminal/command line prompt. </p>
<h2 id="1-create-and-activate-an-environment">1. Create and Activate an Environment</h2>
<h4 id="git-and-version-control">Git and version control</h4>
<p>These instructions also assume you have <code>git</code> installed for working with Github from a terminal window, but if you do not, you can download that first from this <a target="_blank" href="https://www.atlassian.com/git/tutorials/install-git">Github installation page</a>.</p>
<p><strong>Now, you're ready to create your local environment!</strong></p>
<ol>
<li><p>If you haven't already done so, clone the project repository, and navigate to the project folder. </p>
<pre><code class="lang-bash">git <span class="hljs-built_in">clone</span> https://github.com/udacity/DevOps_Microservices.git
<span class="hljs-built_in">cd</span> DevOps_Microservices/project-ml-microservice-kubernetes
</code></pre>
</li>
<li><p>Create (and activate) a new environment, named <code>.devops</code> with Python 3. If prompted to proceed with the install <code>(Proceed [y]/n)</code> type y.</p>
<pre><code class="lang-bash">python3 -m venv ~/.devops
<span class="hljs-built_in">source</span> ~/.devops/bin/activate
</code></pre>
<p> At this point your command line should look something like: <code>(.devops) &lt;User&gt;:project-ml-microservice-kubernetes&lt;user&gt;$</code>. The <code>(.devops)</code> indicates that your environment has been activated, and you can proceed with further package installations.</p>
</li>
</ol>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div><div role="button" tabindex="0" aria-label="Show Image Fullscreen" class="image-atom--image-atom--1XDdu"><div class="image-atom-content--CDPca"><div class="image-and-annotations-container--1U01s"><img class="image--26lOQ" src="https://video.udacity-data.com/topher/2019/May/5cda15ce_screen-shot-2019-05-13-at-6.11.34-pm/screen-shot-2019-05-13-at-6.11.34-pm.png" alt="Creating an environment" width="500px"></div></div></div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><ol start="3">
<li>Installing dependencies via project <code>Makefile</code>. Many of the project dependencies are listed in the file <code>requirements.txt</code>; these can be installed using <code>pip</code> commands in the provided <code>Makefile</code>. While in your project directory, type the following command to install these dependencies.<pre><code class="lang-bash">make install
</code></pre>
</li>
</ol>
<p>Now most of the <code>.devops</code> libraries are available to you. There are a couple of other libraries that we'll be using, which can be downloaded as specified, below. </p>
<hr>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><h1 id="other-libraries">Other Libraries</h1>
<p>While you still have your <code>.devops</code> environment activated, you will still need to install:</p>
<ul>
<li>Docker</li>
<li>Hadolint</li>
<li>Kubernetes (Minikube)</li>
</ul>
<h2 id="docker">Docker</h2>
<p>You will need to use Docker to build and upload a containerized application. If you already have this installed and created a docker account, you may skip this step.</p>
<ol>
<li><p>You’ll need to <a target="_blank" href="https://hub.docker.com/signup">create a free docker account</a>, where you’ll choose a unique username and link your email to a docker account. <strong>Your username is your unique docker ID.</strong></p>
</li>
<li><p>To install the latest version of docker, choose the Community Edition (CE) for your operating system, <a target="_blank" href="https://docs.docker.com/v17.12/install/">on docker’s installation site</a>. It is also recommended that you install the latest, <strong>stable</strong> release:</p>
</li>
<li><p>After installation, you can verify that you’ve successfully installed docker by printing its version in your terminal: <code>docker --version</code></p>
</li>
</ol>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div><div role="button" tabindex="0" aria-label="Show Image Fullscreen" class="image-atom--image-atom--1XDdu"><div class="image-atom-content--CDPca"><div class="image-and-annotations-container--1U01s"><img class="image--26lOQ" src="https://video.udacity-data.com/topher/2019/May/5cda1a91_screen-shot-2019-05-13-at-6.31.52-pm/screen-shot-2019-05-13-at-6.31.52-pm.png" alt="docker version" width="500px"></div></div></div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><hr>
<h2 id="run-lint-checks">Run Lint Checks</h2>
<p>This project also must pass two lint checks; <code>hadolint</code> checks the Dockerfile for errors and <code>pylint</code> checks the <code>app.py</code> source code for errors.</p>
<ol>
<li><p>Install <code>hadolint</code> following the instructions, <a target="_blank" href="https://github.com/hadolint/hadolint">on hadolint's page</a>: </p>
<p> <strong>For Mac:</strong></p>
<pre><code class="lang-bash"> brew install hadolint
</code></pre>
<p> <strong>For Windows:</strong></p>
<pre><code class="lang-bash"> scoop install hadolint
</code></pre>
</li>
<li><p>In your terminal, type: <code>make lint</code> to run lint checks on the project code. If you haven’t changed any code, all requirements should be satisfied, and you should see a printed statement that rates your code (and prints out any additional comments):</p>
<pre><code class="lang-bash">------------------------------------
Your code has been rated at 10.00/10
</code></pre>
</li>
</ol>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><hr>
<h2 id="install-minikube">Install Minikube</h2>
<p>To run a Kubernetes cluster locally, for testing and project purposes, you need the Kubernetes package, Minikube. This operates in a virtual machine and so you'll need to download two things: A virtual machine (aka a hypervisor) then minikube. Thorough installation instructions can be found <a target="_blank" href="https://kubernetes.io/docs/tasks/tools/install-minikube/">here</a>. Here is how I installed minikube:</p>
<ol>
<li><p>Install VirtualBox:</p>
<p><strong>For Mac:</strong></p>
<pre><code class="lang-bash">brew cask install virtualbox
</code></pre>
<p><strong>For Windows</strong>, I recommend using a <a target="_blank" href="https://www.virtualbox.org/wiki/Downloads">Windows host</a>.</p>
</li>
</ol>
<ol start="2">
<li><p>Install minikube:</p>
<p><strong>For Mac:</strong></p>
<pre><code class="lang-bash">brew cask install minikube
</code></pre>
<p><strong>For Windows</strong>, I recommend using the <a target="_blank" href="https://kubernetes.io/docs/tasks/tools/install-minikube/">Windows installer</a>.</p>
</li>
</ol>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><hr>
<h2 id="that-s-it-">That's it!</h2>
<p>Setting up an environment is an important part of development. Now you are ready to start working on the project files to containerize a machine learning application!</p>
