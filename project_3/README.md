# Build an automated CI/CD Pipeline for UdaPeople
In this project, you’ll demonstrate your Cloud DevOps engineer skills as a new employee at UdaPeople, an innovative new Human Resources company that depends on quick release cycles and a rock solid, high-quality product. You will help the development team deliver value continuously by building an automated CI/CD pipeline. Those new skills will also be put to the test as you set up automated monitoring and alerting to ensure the delivered value stays valuable. Thanks to your new skills and hard work, UdaPeople will have a massive competitive advantage in the PeopleOps marketplace and will surely go on to change the world!   

Project Overview:

[![](http://img.youtube.com/vi/ttJQKyEa1o4/0.jpg)](http://www.youtube.com/watch?v=ttJQKyEa1o4 "Project 3 -Overview")

## Project Outline
<h3 id="a-aws-steps">A. AWS Steps</h3>
<ol>
<li><p>Log in to the AWS management console, as a <strong>Root user</strong>. Find and select the IAM (Identify and Access Management) service.</p>
</li>
<li><p>Click on "Group" menu item from the left sidebar. Create a new group and name it "jenkins", and attach the following policies: </p>
<ul>
<li>AmazonEC2FullAccess</li>
<li>AmazonVPCFullAccess</li>
<li>AmazonS3FullAccess. </li>
</ul>
</li>
<li><p>Create an IAM user</p>
<ul>
<li><p>Click on "Users" menu item from the left sidebar. Create a new IAM User, select "Users" from the left sidebar, then "Add user," and use "jenkins" as the user name. Click on both "programmatic access" and "AWS management console access." The defaults for auto-generated password and "users must create a new password at next sign-in" are OK and should be kept. Hit "Next", and add the "jenkins" user to the "jenkins" group. Hit "next," no need to add "Tags." Review, and accept. Capture the Access Key, Secret Access Key, and the password so that you can log in as IAM user in the next step. (easy to just download the csv file).</p>
</li>
<li><p><strong>Screenshot-01</strong> - Go to IAM dashboard, as the root user. Click on "Users" menu item from the sidebar and select the user that you have just created from the displayed result. Click on the "Permissions" tab. <strong>Please provide a screenshot of the AWS console with the permissions being created. Name this 'screenshot-01.'</strong></p>
</li>
<li>Copy the IAM User sign-in link from the IAM Dashboard.</li>
</ul>
</li>
<li><p>Sign in as the new IAM user in a new browser window.</p>
<ul>
<li>First, sign out of the AWS console. Then, use the IAM User sign-in link copied from the previous step.</li>
<li>Alternatively, you can login as the root user. Go to IAM dashboard.  Click on "Users" menu item from the left sidebar. Select the 'jenkins' user link, and go to the Security credentials tab. Copy the "Console sign-in link". </li>
<li>If you haven't copied the IAM User sign-in link, you can generate the URL as follows:<ul>
<li>In the following syntax <code>https://&lt;your_aws_account_id&gt;.signin.aws.amazon.com/console/</code>, replace the <code>&lt;your_aws_account_id&gt;</code> with your AWS account number without the hyphens (for example, if your AWS account number is 1234-5678-9012, your AWS account ID is 123456789012)</li>
</ul>
</li>
</ul>
</li>
</ol>
<ol start="5">
<li><p>Create a new key pair for access to your instance(s). Choose EC2 as the service after logging in. Select "Key Pairs" from the sidebar on the left, from the "Network and Security" section. Enter the "pipeline" name when prompted. Save the ".pem" file.
 If you will use an SSH client on a Mac or Linux computer to connect to your Linux instance, use the following command to set the permissions of your private key file so that only you can read it:</p>
<p> <code>chmod 400 your_user_name-key-pair-region_name.pem</code></p>
</li>
<li><p>Launch the EC2 t2.micro for the free tier, pick "Ubuntu 18.04 LTS amd64," review, and when hitting "launch" <em>ensure</em> that an existing pair ("pipeline") from before is selected. If you're not using the right key pair, you cannot log in. <strong>Now, an Ubuntu 18.04 t2.micro instance is launched in the AWS EC2, that can be accessed via SSH using the PEM file. A screenshot showing the unique AWS URL of your EC2 instance should be captured. Name this 'screenshot-02.'</strong></p>
</li>
<li><p>Once launched, create a security group for the vm. In the left sidebar, under Network and Security, select "Security Groups."
Under name, use: 'jenkins', description: "basic Jenkins security group," VPC should have the default one used.
Click Add Rule:
Custom TCP Rule, Protocol:
TCP, Port Range 8080, Source 0.0.0.0/0
Then add the SSH rule: Protocol: SSH, Port range: 22, From source, use the dropdown and select "My IP."</p>
</li>
<li><p>Go back to instances, and right-click the running instance, select Networking and change the security groups. Select the Jenkins security group that was created previously.</p>
</li>
<li><p>To connect to your instance using your key pair, follow these steps. Right click your running instance and select "Connect," then follow the instructions to SSH into it. For example, here are the directions that popped up in my AWS console on how to SSH into my machine (your directions will not look exactly like this, since portions of the information, like the full domain address of the instance, will be different):</p>
</li>
</ol>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div><div role="button" tabindex="0" aria-label="Show Image Fullscreen" class="image-atom--image-atom--1XDdu"><div class="image-atom-content--CDPca"><div class="image-and-annotations-container--1U01s"><img class="image--26lOQ" src="https://video.udacity-data.com/topher/2019/July/5d2e076f_screen-shot-2019-07-16-at-10.18.22-am/screen-shot-2019-07-16-at-10.18.22-am.png" alt="" width="637px"></div></div></div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><h3 id="b-install-jenkins-on-ubuntu">B. Install Jenkins On Ubuntu</h3>
<p>Here are the key commands for installation:</p>
<ul>
<li><code>apt update</code></li>
<li><code>apt upgrade</code></li>
<li><code>apt install default-jdk</code></li>
</ul>
<p>The Jenkins version you get with the default Ubuntu packages is often not the latest available version you can get from the Jenkins project itself. For the most recent features and fixes, you can use the packages from the Jenkins site to install Jenkins.</p>
<p>First, use <code>wget</code> to add the repo key to the system:</p>
<pre><code>wget -q -O - https://pkg.jenkins.<span class="hljs-built_in">io</span>/debian/jenkins.<span class="hljs-built_in">io</span>.key | sudo apt-key add -
</code></pre><p>When the key is added, the system returns OK. Next, append the Debian package repo address to the server's sources.list:</p>
<pre><code><span class="hljs-title">sudo</span> sh -c <span class="hljs-string">'echo deb http://pkg.jenkins.io/debian-stable binary/ &gt; /etc/apt/sources.list.d/jenkins.list'</span>
</code></pre><p>When both of these are all set, run <code>update</code> so that <code>apt</code> will use the new repo:</p>
<pre><code><span class="hljs-title">sudo</span> apt update
</code></pre><p>Lastly, install Jenkins and its dependencies:</p>
<pre><code><span class="hljs-title">sudo</span> apt install jenkins
</code></pre><p>Since <code>systemctl</code> doesn't produce output, you can use its <code>status</code> command to confirm that Jenkins began successfully:</p>
<pre><code><span class="hljs-title">sudo</span> systemctl status jenkins
</code></pre><p>If all went well, the first lines of the output will show that the service is active and configured to start at boot, as shown below:</p>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div><div role="button" tabindex="0" aria-label="Show Image Fullscreen" class="image-atom--image-atom--1XDdu"><div class="image-atom-content--CDPca"><div class="image-and-annotations-container--1U01s"><img class="image--26lOQ" src="https://video.udacity-data.com/topher/2019/July/5d2cdf7b_screen-shot-2019-07-15-at-1.17.49-pm/screen-shot-2019-07-15-at-1.17.49-pm.png" alt="" width="760px"></div></div></div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><h3 id="c-set-up-jenkins">C. Set Up Jenkins</h3>
<ol>
<li><p>Visit Jenkins on its default port, 8080, with your server IP address or domain name included like this: <a target="_blank" href="http://your_server_ip_or_domain:8080/">http://your_server_ip_or_domain:8080</a>.</p>
</li>
<li><p><strong>Please provide a screenshot that includes the unique AWS url (ensure the FQDN is used, <em>not</em> the IP). Name this "screenshot-03."</strong></p>
</li>
<li><p>Next you will see the "Unlock Jenkins" screen, displaying the location of the initial password. In the terminal, use <code>cat</code> to show the password:</p>
<p> <code>sudo cat /var/lib/jenkins/secrets/initialAdminPassword</code></p>
</li>
<li><p>Copy and paste the 32-character alphanumeric password from the terminal into the Admin password field, then Continue.</p>
</li>
<li><p>The next screen gives you the choice of installing recommended plugins, or selecting specific plugins - choose the Install suggested plugins option, which quickly begins the installation process.</p>
</li>
<li><p>When installation is complete, you are prompted to set up the first admin user. Create the admin user and make note of both the user and password to use in the future.</p>
</li>
<li><p>You next see an Instance Configuration page, asking you to confirm the preferred URL for your Jenkins instance. Confirm the address, click save and finish.</p>
</li>
</ol>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><h3 id="d-install-blue-ocean-plugin">D. Install Blue Ocean plugin</h3>
<ol>
<li><p>"Blue Ocean" and other required plugins need to be installed. Logged in as an admin, go to the top left, click 'Jenkins', then 'manage Jenkins', and select 'Manage Plugins'.</p>
</li>
<li><p>Use the "Available" tab, filter by "Blue Ocean," select the first option ("BlueOcean aggregator") and install without a restart.</p>
</li>
<li><p>Filter once again for "pipeline-aws" and install, this time selecting "Download now and install after restart."</p>
</li>
<li><p>Once all plugins are installed, Jenkins will restart. If it hasn't restarted, run the following in the VM:</p>
<p> <code>sudo systemctl restart jenkins</code></p>
</li>
<li><p>Verify everything is working for Blue Ocean by logging in. An "Open Blue Ocean" link should show up in the sidebar. Click it, and it will take you to the "Blue
Ocean" screen, where we will have to add a project.</p>
</li>
<li><p><strong>Please provide a screenshot that includes the unique AWS url, and shows the sidebar with the Blue Ocean link (ensure the FQDN is used, <em>not</em> the IP). Name this "screenshot-04."</strong></p>
</li>
<li><p>A welcome screen will appear, telling you it is time to create your first pipeline.</p>
</li>
<li><p>Click "create pipeline."</p>
</li>
</ol>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><h3 id="e-set-up-a-github-repository">E. Set up a GitHub Repository</h3>
<p><strong>Note: A GitHub account is required for the next steps.</strong></p>
<ol>
<li><p>Create a new repository in your GitHub account named 'static'. In the repo, create two files: "index.html" and "Jenkinsfile".</p>
<ul>
<li>The "Jenkinsfile" should look like this:</li>
</ul>
</li>
</ol>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div><div role="button" tabindex="0" aria-label="Show Image Fullscreen" class="image-atom--image-atom--1XDdu"><div class="image-atom-content--CDPca"><div class="image-and-annotations-container--1U01s"><img class="image--26lOQ" src="https://video.udacity-data.com/topher/2019/July/5d2ce7f5_screen-shot-2019-07-15-at-1.52.21-pm/screen-shot-2019-07-15-at-1.52.21-pm.png" alt="" width="745px"></div></div></div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><ul>
<li>The "index.html" file should look like this:</li>
</ul>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><pre><code><span class="hljs-doctype">&lt;!doctype html&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">html</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-title">head</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-title">title</span>&gt;</span>Static HTML Site<span class="hljs-tag">&lt;/<span class="hljs-title">title</span>&gt;</span>
  <span class="hljs-tag">&lt;/<span class="hljs-title">head</span>&gt;</span>
  <span class="hljs-tag">&lt;<span class="hljs-title">body</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-title">p</span>&gt;</span>This is the first paragraph in a simple Static HTML site. There is no <span class="hljs-tag">&lt;<span class="hljs-title">strong</span>&gt;</span>CSS<span class="hljs-tag">&lt;/<span class="hljs-title">strong</span>&gt;</span> or <span class="hljs-tag">&lt;<span class="hljs-title">strong</span>&gt;</span>JavaScript<span class="hljs-tag">&lt;/<span class="hljs-title">script</span>&gt;</span>.<span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
  <span class="hljs-tag">&lt;/<span class="hljs-title">body</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">html</span>&gt;</span>
</code></pre></div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><ol start="2">
<li><p>Commit and push your changes.</p>
</li>
<li><p>Select GitHub from the options available, a token needs to be generated. A link to <a target="_blank" href="https://github.com/settings/tokens/new?scopes=repo,read:user,user:email,write:repo_hook">https://github.com/settings/tokens/new?scopes=repo,read:user,user:email,write:repo_hook</a> needs to be clicked to generate a token for Jenkins to use. You can select the default <strong><em>scopes</em></strong> in the opened link, that defines the access for a personal token for Jenkins. </p>
</li>
<li><p>Authenticate in Github, and add a note for what this token is (easier for later removal): "Jenkins Pipeline."</p>
</li>
<li><p><em>Make sure you copy the token - there is no way to see it again!</em></p>
</li>
<li><p>After pasting the token into the form in Jenkins, click "connect", and your account should show up. If your account belongs to multiple organizations, they
will be listed - make sure you use your personal account and organization.</p>
</li>
<li><p>Next, search for "static" so that the repo is matched, and click "create pipeline."</p>
</li>
<li><p>The pipeline should show up with a new run.</p>
</li>
<li><p><strong>Please provide a screenshot that includes the unique AWS url, and shows the GitHub project as a pipeline (ensure the FQDN is used, <em>not</em> the IP). Name this "screenshot-05."</strong></p>
</li>
<li><p>In the page where the 'static' job shows, there is a gear icon - click on it to edit the job directly. Find the "Scan repository triggers" and click on
"Periodically if not otherwise run," and select an interval of 2 minutes.</p>
</li>
</ol>
<p><strong>This completes the initial pipeline setup for Jenkins</strong>!</p>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><h3 id="f-set-up-aws-credentials-in-jenkins">F. Set up AWS credentials in Jenkins</h3>
<p>Credentials need to be created so that they can be used in our pipeline.</p>
<ol>
<li><p>Leave the Blue Ocean GUI, and go back to the main Jenkins page. Then click on the “Credentials” link from the sidebar.</p>
</li>
<li><p>Click on "(global)" from the list, and then "Add credentials" from the sidebar.</p>
</li>
<li><p>Choose "AWS Credentials" from the dropdown, add "aws-static" on ID, add a description like "Static HTML publisher in AWS," and fill in the AWS Key and
Secret Access Key generated when the IAM role was created.</p>
</li>
<li><p>Click OK, and the credentials should now be available for the rest of the system.</p>
</li>
</ol>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><h3 id="g-set-up-s3-bucket">G. Set up S3 Bucket</h3>
<p>In order to publish the contents, we need to create a bucket in S3 that has the
right permissions to add files and that others can get access to.</p>
<ol>
<li><p>Log in to the console for the 'jenkins' user that was created in the beginning, and select the 'S3' service.</p>
</li>
<li><p>Create a new bucket, and make it a unique name. The system will not let you continue creation if the name is not unique. <em>Remember this name for later
configuration</em>.</p>
</li>
<li><p>Take note of the region. This will also be used later.</p>
</li>
<li><p>Select "next" to configure options, do not select any special options, then hit "next" again.</p>
</li>
<li><p>For "Set Permissions," uncheck the "Block all public access." Hit "next" once again, review the settings, and click "continue."</p>
</li>
<li><p>The new bucket should be available in the S3 console. Click it to get to the configuration panel for that bucket.</p>
</li>
<li><p>Select the "Properties" tab, and click on "Static website hosting." Enable the "Use this bucket to host a website" and type in "index.html" for the Index
document. Click "save."</p>
</li>
<li><p>Select the "Permissions" tab.</p>
</li>
<li><p>Click on "Bucket policy" and add the following:</p>
</li>
</ol>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div><div role="button" tabindex="0" aria-label="Show Image Fullscreen" class="image-atom--image-atom--1XDdu"><div class="image-atom-content--CDPca"><div class="image-and-annotations-container--1U01s"><img class="image--26lOQ" src="https://video.udacity-data.com/topher/2019/July/5d2cece0_screen-shot-2019-07-15-at-2.13.39-pm/screen-shot-2019-07-15-at-2.13.39-pm.png" alt="" width="633px"></div></div></div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><ol start="10">
<li><p>Replace 'NAME_OF_BUCKET' with the bucket that was just created.</p>
</li>
<li><p>Click save, and "Permissions public" should now show in the tab.</p>
</li>
</ol>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><h3 id="h-set-up-pipeline-for-aws">H. Set up pipeline for AWS</h3>
<ol>
<li><p>Go back to your project, and edit "Jenkinsfile." Replace the "Build" stage with "Upload to AWS."</p>
</li>
<li><p>This stage should upload the "index.html" file using the region and credentials for AWS.</p>
</li>
<li><p>The "withAWS" and "s3Upload" utilities from the "pipeline-aws" plugin should be used. "withAWS" is documented here: <a target="_blank" href="https://github.com/jenkinsci/pipeline-aws-plugin#withaws">https://github.com/jenkinsci/pipeline-aws-plugin#withaws</a>.
"s3Upload" is documented here: <a target="_blank" href="https://github.com/jenkinsci/pipeline-aws-plugin#s3upload">https://github.com/jenkinsci/pipeline-aws-plugin#s3upload</a>.</p>
</li>
</ol>
<p><strong>The "credentials" need to match the name given when they were created in Jenkins (see the "Set up AWS credentials in Jenkins" section on this page for reference).</strong></p>
<ol start="4">
<li><p>Save, commit, and push. Within minutes, a new run should appear - it should be successful.</p>
</li>
<li><p>To verify, go to the URL where the static S3 website is: <a target="_blank" href="http://bucket_name.s3-website.region.amazonaws.com/">http://BUCKET_NAME.s3-website.REGION.amazonaws.com/</a>. Replace "BUCKET_NAME" with the bucket that was created early, and "REGION" with the according region where the bucket exists.</p>
</li>
</ol>
<p>The contents of the "index.html" file should exist there.</p>
<ol start="6">
<li><strong>Please provide a screenshot that includes the unique AWS url, and shows "index.html" rendered. Name it "screenshot-06."</strong></li>
</ol>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><h3 id="i-add-another-stage-in-pipeline">I. Add another stage in pipeline</h3>
<p>The index file has an invalid HTML in there. To prevent getting an invalid HTML, we are going to run a linter so that it fails the job if anything gets in that is
invalid.</p>
<ol>
<li><p>Connect to the host where Jenkins is installed, and install the following system dependency:
 <code>sudo apt-get install -y tidy</code>
This would install the <code>tidy</code> linter in the server.</p>
</li>
<li><p>Now that the system dependency is installed, add a new stage for linting the HTML in the project, <em>before the "Upload to AWS" stage</em>, that runs the ‘tidy’ utility. Name it "Lint HTML." The command that runs the linter is <code>tidy -q -e *.html</code>. </p>
</li>
<li><p>Commit this new change and push to GitHub, then wait a couple of minutes.
<strong><em>The build should now </em>FAIL<em> at the linting step, because the HTML is invalid and has an error.</em></strong></p>
</li>
<li><p><strong>Please provide a screenshot that includes the unique AWS url, and shows the failure when linting. Name it "screenshot-07."</strong></p>
</li>
<li><p>Go edit the "index.html" file again, find the invalid portion, and replace it with the correct version so that the linter does not complain. The job should now pass without problems.</p>
</li>
<li><p><strong>Please provide a screenshot that includes the unique AWS url, and shows passing the linting stage and deploys to S3. Name it "screenshot-08."</strong></p>
</li>
</ol>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><h3 id="this-is-what-the-last-passing-build-should-look-like">This is what the last passing build should look like</h3>
<p>Please note the "Upload complete" message, and the "Lint HTML" step showing as the first item after "Start."</p>
</div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div><div role="button" tabindex="0" aria-label="Show Image Fullscreen" class="image-atom--image-atom--1XDdu"><div class="image-atom-content--CDPca"><div class="image-and-annotations-container--1U01s"><img class="image--26lOQ" src="https://video.udacity-data.com/topher/2019/July/5d2cf7cc_screen-shot-2019-07-15-at-3.01.35-pm/screen-shot-2019-07-15-at-3.01.35-pm.png" alt="" width="1044px"></div></div></div></div><span></span></div></div></div><div><div class="index--container--2OwOl"><div class="index--atom--lmAIo layout--content--3Smmq"><div class="ltr"><div class="index-module--markdown--2MdcR ureact-markdown "><hr>
<hr>  

## Screenshot of The Results
1. AWS Steps  
 ![screenshot-01](./images/screenshot-01.png "screenshot-01")

 ![screenshot-02](./images/screenshot-02.png "screenshot-02")
2. Install Jenkins On Ubuntu   
3. Set Up Jenkins  
 ![screenshot-03](./images/screenshot-03.png "screenshot-03")
4. Install required plugins
 ![screenshot-04](./images/screenshot-04.png "screenshot-04")
5. Set up GitHub  
 ![screenshot-05](./images/screenshot-05.png "screenshot-05")
6. Set up AWS credentials in Jenkins
7. Set up S3 Bucket  
8. Set up pipeline for AWS  
 ![screenshot-06](./images/screenshot-06.png "screenshot-06")
9. Add another stage in pipeline  
 ![screenshot-07](./images/screenshot-07.png "screenshot-07")
 ![screenshot-08](./images/screenshot-08.png "screenshot-08")
