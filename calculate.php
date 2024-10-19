<?php
include 'adminback.php';
$admin = new adminback();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $dish_count = $_POST['dish_count'];
    $package_id = $_POST['package_id'];

    // Calculate the total amount
    $total_amount = calculate_total($package_id, $dish_count);

    // Calculate the staff count
    $staff_info = calculate_staff_count($dish_count);

    // Send the response as a JSON object
    // Send the response as a JSON object
    echo json_encode([
        'total_amount' => $total_amount,
        'staff_count' => $staff_info['total_staff'],
        'chefs' => $staff_info['chefs'],
        'coordinators' => $staff_info['coordinators'],
        'waitstaff' => $staff_info['waitstaff']
    ]);
}

// Functions for calculations
function calculate_total($package_id, $dish_count)
{
    global $admin;

    if (!is_null($package_id)) {
        $package = $admin->display_packageByID($package_id);
        if ($package) {
            $package_price = $package['price'];
            return $package_price * $dish_count;
        }
    }
    return false;
}

function calculate_staff_count($dish_count)
{
    // Minimum 300 dishes and corresponding staff
    $base_dishes = 300;
    $total_staff_base = 12; // Total staff for 300 dishes
    
    // Calculate the number of increments
    $increments = $dish_count / $base_dishes;
    
    // Calculate total staff based on increments
    $total_staff = ceil($total_staff_base * $increments);

    // Split the total staff into roles based on proportions
    $chefs = ceil(($total_staff / 12) * 3); // 3 out of 12 are chefs
    $coordinators = ceil(($total_staff / 12) * 1); // 1 out of 12 is a coordinator
    $waitstaff = ceil(($total_staff / 12) * 8); // 8 out of 12 are waitstaff

    // Return staff details as an associative array
    return [
        'chefs' => $chefs,
        'coordinators' => $coordinators,
        'waitstaff' => $waitstaff,
        'total_staff' => $total_staff
    ];
}


