<?php

// Connect to the database
/*$dsn = 'mysql:host=localhost;dbname=arcadia';
$username = 'root';
$password = '';

try {
    $pdo = new PDO($dsn, $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
    exit;
}*/
class Connection
{
    private $dbHost;
    private $dbName;
    private $dbUser;
    private $dbPass;
    public $connection;

    public function __construct($dbHost = 'localhost', $dbName = 'arcadia', $dbUser = 'root', $dbPass = '')
    {
        $this->dbHost = $dbHost;
        $this->dbName = $dbName;
        $this->dbUser = $dbUser;
        $this->dbPass = $dbPass;
    }
    public function connect()
    {
        $this->connection = new PDO("mysql:host=" . $this->dbHost . ";dbname=" . $this->dbName, $this->dbUser, $this->dbPass);
        $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    public function close()
    {
        if ($this->connection) {
            $this->connection = null;
        }
    }
    public function getConnection()
    {
        return $this->connection;
    }
}
