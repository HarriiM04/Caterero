<?php

class  adminback
{
    //changed to public from private
    public $connection;
    function __construct()
    {
        $dbhost = "localhost";
        $dbuser = "root";
        $dbpass = "";
        $dbname = "ecommerce";

        $this->connection = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

        if (!$this->connection) {
            die("Databse connection error!!!");
        }
    }

    public function display_userEmail()
    {
        $query = "SELECT email FROM users";
        $result = $this->connection->query($query);

        if ($result) {
            return $result;
        } else {
            return false; // Handle error accordingly
        }
    }

    public function display_cart_count($customerMail)
    {
        $query = "SELECT COUNT(id) AS cart_count FROM cart WHERE customer_id IN (SELECT id FROM users WHERE email = ?)";
        $stmt = $this->connection->prepare($query);
        $stmt->bind_param("s", $customerMail);  // "s" specifies that it's a string
        $stmt->execute();
        $result = $stmt->get_result();
    
        if ($result) {
            $row = $result->fetch_assoc();
            return $row['cart_count']; // Return the cart count
        } else {
            return false; // Handle error accordingly
        }
    }
    
    

    public function display_userId_by_email($email)
    {
        // Prepare the query to prevent SQL injection
        $query = "SELECT id FROM users WHERE email = ?";
        $stmt = $this->connection->prepare($query); // Prepare the statement

        if ($stmt) {
            // Bind the email parameter to the prepared statement
            $stmt->bind_param('s', $email); // 's' indicates that the parameter is a string
            $stmt->execute(); // Execute the statement

            // Fetch the result
            $result = $stmt->get_result();

            if ($result && $result->num_rows > 0) {
                // Fetch the user id
                $row = $result->fetch_assoc();
                return $row['id']; // Return the user ID
            } else {
                return false; // No user found
            }
        } else {
            return false; // Query preparation failed
        }
    }






    public function display_package()
    {
        $query = "SELECT * FROM Package";
        $result = $this->connection->query($query);

        if ($result) {
            return $result;
        } else {
            return false; // Handle error accordingly
        }
    }

    public function display_order($customerMail)
    {
        $query = "SELECT o.Id, u.firstname, o.order_date, o.type, p.name
                     FROM orders AS o
                        JOIN users AS u ON o.Cust_id = u.id
                            JOIN package AS p ON o.package_id = p.id where o.Cust_id = (SELECT id FROM users WHERE email = '$customerMail')
                                ";
        $result = $this->connection->query($query);

        if ($result) {
            return $result;
        } else {
            return false; // Handle error accordingly
        }
    }

    public function display_orderAdmin($customerMail)
    {
        $query = "SELECT o.Id, u.firstname, o.order_date, o.type, p.name
                     FROM orders AS o
                        JOIN users AS u ON o.Cust_id = u.id
                            JOIN package AS p ON o.package_id = p.id 
                                ";
        $result = $this->connection->query($query);

        if ($result) {
            return $result;
        } else {
            return false; // Handle error accordingly
        }
    }

   

    public function assign_designation_staff($designation, $count)
    {
        // Fetch available staff by designation and status
        $sql = "SELECT Id FROM staff WHERE designation = ? AND status = 0 LIMIT ?";
        $stmt = $this->connection->prepare($sql);
        $stmt->bind_param("si", $designation, $count);
        $stmt->execute();
        $result = $stmt->get_result();

        // Update status of assigned staff to '1' (Assigned)
        while ($row = $result->fetch_assoc()) {
            $staff_id = $row['Id'];
            $update_sql = "UPDATE staff SET status = 1 WHERE Id = ?";
            $update_stmt = $this->connection->prepare($update_sql);
            $update_stmt->bind_param("i", $staff_id);
            $update_stmt->execute();
        }
    }

    public function create_order($cust_mail, $order_date, $package_id, $dish_count, $total_amount, $staff_count, $service_address, $service_date)
    {
        $query = "INSERT INTO orders (Cust_id, order_date, type, package_id, dish_count, total_amount, staff_count, status, service_address, service_date) 
                  VALUES ((SELECT id FROM users WHERE email = ?), ?, 'Package', ?, ?, ?, ?, 'Pending', ?, ?)";

        $stmt = $this->connection->prepare($query);
        $stmt->bind_param("ssiiisss", $cust_mail, $order_date, $package_id, $dish_count, $total_amount, $staff_count, $service_address, $service_date);

        if ($stmt->execute()) {
            return true; // Order successfully created
        } else {
            return false; // Handle error accordingly
        }
    }


    //for cart
    public function display_cart_by_customer($customer_mail)
    {
        // Query to select cart records for a specific customer
        $query = "SELECT p.name,p.id,p.image,p.price FROM package as p join cart on p.id = cart.package_id WHERE cart.customer_id =  (SELECT id FROM users WHERE email = ?)";
        $stmt = $this->connection->prepare($query);
        $stmt->bind_param("s", $customer_mail);
        $stmt->execute();
        $result = $stmt->get_result();

        // If the query is successful, return the result set
        if ($result) {
            return $result;
        } else {
            // If the query fails, return false
            return false;
        }
    }

    public function getItemsByIds($ids)
    {
        $query = "SELECT Name, CategoryID FROM items WHERE Id IN ($ids)";
        return mysqli_query($this->connection, $query);
    }


    public function getCategoryById($categoryId)
    {
        $query = "SELECT name FROM catagory WHERE id = ?";
        $stmt = $this->connection->prepare($query);
        $stmt->bind_param('i', $categoryId);
        $stmt->execute();
        return $stmt->get_result();
    }


    public function getCategoriess()
    {
        $query = "SELECT * FROM catagory";
        return mysqli_query($this->connection, $query); // Return result set
    }

    public function display_packageByID($id)
    {
        $query = "SELECT * FROM Package WHERE id = ?";
        $stmt = $this->connection->prepare($query);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result) {
            return $result->fetch_assoc();  // Return the package data as an associative array
        } else {
            return false; // Handle error accordingly
        }
    }

    public function getCartItemsByCustomerId($customerId)
    {
        $query = "SELECT c.id, c.package_id, p.name, p.price 
                  FROM cart c 
                  JOIN Package p ON c.package_id = p.id 
                  WHERE c.custpackage_id = ?";
        $stmt = $this->connection->prepare($query);
        $stmt->bind_param("i", $customerId);
        $stmt->execute();
        $result = $stmt->get_result();

        $cartItems = [];
        while ($row = $result->fetch_assoc()) {
            $cartItems[] = $row; // Add package details to the cart items
        }

        $stmt->close();
        return $cartItems;
    }
    public function getCartTotalByCustomerId($customerId)
    {
        $query = "SELECT SUM(p.price) AS total 
                  FROM cart c 
                  JOIN Package p ON c.package_id = p.id 
                  WHERE c.custpackage_id = ?";

        $stmt = $this->connection->prepare($query);
        $stmt->bind_param("i", $customerId);
        $stmt->execute();
        $stmt->bind_result($total);
        $stmt->fetch();
        $stmt->close();

        return $total ? $total : 0; // Return total if not null, otherwise return 0
    }
    public function addToCart($customerMail, $packageId)
    {
        $customerId = $this->display_userId_by_email($customerMail);
        // Check if the item is already in the cart  
        $checkQuery = "SELECT * FROM cart WHERE customer_id = ? AND package_id = ?";
        $checkStmt = $this->connection->prepare($checkQuery);
        $checkStmt->bind_param("ii", $customerId, $packageId);
        $checkStmt->execute();
        $checkResult = $checkStmt->get_result();

        if ($checkResult->num_rows > 0) {
            // Item already exists in the cart
            $checkStmt->close();
            return "Item already exists in the cart.";
        } else {
            // Insert the new item into the cart
            $insertQuery = "INSERT INTO cart (customer_id, package_id) VALUES ((SELECT id FROM users WHERE email = ?), ?)";

            $insertStmt = $this->connection->prepare($insertQuery);
            $insertStmt->bind_param("si", $customerMail, $packageId);
            if ($insertStmt->execute()) {
                $insertStmt->close();
                return "Item added to cart successfully.";
            } else {
                $insertStmt->close();
                return "Failed to add item to cart.";
            }
        }
        $checkStmt->close();
    }
}
