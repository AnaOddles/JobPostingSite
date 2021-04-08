<?php

namespace App\services\data\Utility;

// use App\Models\CustomerModel;
// use Carbon\Exceptions\Exception;
use mysqli;

class DBConnect {
    private $conn;
    private $serverName;
    private $username;
    private $password;
    private $dbname;
    
    public function __construct(string $dbname) {
        // initialize the properties
        $this->dbname = $dbname;
        $this->serverName = "127.0.0.1:54668";
        $this->username = "azure";
        $this->password = "6#vWHD_$";
    }
    
    public function getDbConnect() {
        // oop style programming
        $this->conn = new mysqli($this->serverName, $this->username, $this->password, $this->dbname);
        
        // error checking
        if ($this->conn->connect_errno) {
            echo "Failed to connect to MySQL " . $this->conn->connect_errno;
            exit();
        }
        return($this->conn);
    }
    /*
     * close the connection
     */
    public function closeDbConnect() {
        // oop style
        $this->conn->close();
    }
    
    /*
     * Turn ON Autocommit
     */
    public function setDbAutocommitTrue() {
        // turn autocommit on
        // default state is enabled
        $this->conn->autocommit(TRUE);
    }
    
    /*
     * turn off autocommit
     */
    public function setDbAutocommitFalse() {
        // turn autocommit off
        $this->conn->autocommit(FALSE);
    }
    
    /*
     * begin a transaction
     */
    public function beginTransaction() {
        $this->conn->begin_transaction();
    }
    
    /*
     * commit the transaction
     */
    public function commitTransaction() {
        $this->conn->commit();
    }
    
    /*
     * rollback a transaction
     */
    public function rollbackTransaction() {
        $this->conn->rollback();
    }
}

