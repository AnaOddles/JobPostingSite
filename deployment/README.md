These things need to be altered for the deployment: 

After uploading the JobPostingSite.zip contents into the myapp directory and setting up database...

1) Access the .env file in the root directory and alter to this: 
```php DB_CONNECTION=mysql
      DB_HOST=127.0.0.1
      DB_PORT=54668
      DB_DATABASE=JobPostingSite
      DB_USERNAME=azure
      DB_PASSWORD='6#vWHD_$'`

This establishes a connection to our Azure database automatically however we must use the Azure connection string. 
  
 2) Remove any public directory references from any images src or asset calls. 
    Example: 
    In layout - css file, js file, svg logo image
    Profile & Portfolio index pages - remove the public from {{asset('public/profile_pics/)}} for the profile images
    
  3) Affinity Groups - services/data/Utility/DbConnect
  The affinity groups uses a separate connection to the DB so we need to alter the connection to the azure DB 
  Change the connections server name, username, password 
  ```php
        $this->serverName = "127.0.0.1:54668";
        $this->username = "azure";
        $this->password = "6#vWHD_$";```
        
  4) Remove the /public from azure URL 
  We can hide the /public from the URL by using a virtual path, DOES NOT REMOVE BUT HIDES/REPLACES IT 
  
  To do this go to Azure resource page
  1) Left Scroll Side Panel Settings > Configuration
  2) Path Mappings 
  3) Virtual Applications and directories 
  4) Add a new directory or edit current one 
  5) Set physical path to "site\wwwroot\myap\public" type to "Application" and Virtual Path to "/" 


See files for database file for setting up and the files the need to change
        
  
    
