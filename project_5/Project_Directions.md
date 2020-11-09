
<h2 id="steps-in-completing-your-project">Steps in Completing Your Project</h2>
<h4 id="step-1-propose-and-scope-the-project">Step 1: Propose and Scope the Project</h4>
<ul>
<li>Plan what your pipeline will look like. </li>
<li>Decide which options you will include in your Continuous Integration phase. </li>
<li>Use Jenkins.</li>
<li>Pick a deployment type - either rolling deployment or blue/green deployment. </li>
<li>For the Docker application you can either use an application which you come up with, or use an open-source application pulled from the Internet, or if you have no idea, you can use an Nginx “Hello World, my name is (student name)” application. </li>
</ul>
<h4 id="step-2-use-jenkins-and-implement-blue-green-or-rolling-deployment-">Step 2: Use Jenkins, and implement blue/green or rolling deployment.</h4>
<ul>
<li>Create your Jenkins master box with either Jenkins and install the plugins you will need. </li>
<li>Set up your environment to which you will deploy code.</li>
</ul>
<h4 id="step-3-pick-aws-kubernetes-as-a-service-or-build-your-own-kubernetes-cluster-">Step 3: Pick AWS Kubernetes as a Service, or build your own Kubernetes cluster.</h4>
<ul>
<li>Use Ansible or CloudFormation to build your “infrastructure”; i.e., the Kubernetes Cluster.</li>
<li>It should create the EC2 instances (if you are building your own), set the correct networking settings, and deploy software to these instances. </li>
<li>As a final step, the Kubernetes cluster will need to be initialized. The Kubernetes cluster initialization can either be done by hand, or with Ansible/Cloudformation at the student’s discretion.</li>
</ul>
<h4 id="step-4-build-your-pipeline">Step 4: Build your pipeline</h4>
<ul>
<li>Construct your pipeline in your GitHub repository.</li>
<li>Set up all the steps that your pipeline will include. </li>
<li>Configure a deployment pipeline. </li>
<li>Include your Dockerfile/source code in the Git repository. </li>
<li>Include with your Linting step both a failed Linting screenshot and a successful Linting screenshot to show the Linter working properly.</li>
</ul>
<h4 id="step-5-test-your-pipeline">Step 5: Test your pipeline</h4>
<ul>
<li>Perform builds on your pipeline. </li>
<li>Verify that your pipeline works as you designed it. </li>
<li>Take a screenshot of the Jenkins pipeline showing deployment and a screenshot of your AWS EC2 page showing the newly created (for blue/green) or modified (for rolling) instances. Make sure you name your instances differently between blue and green deployments.</li>
</ul>
