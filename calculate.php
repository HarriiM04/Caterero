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
    $base_dishes = 500;
    $chefs = 5;
    $coordinators = 2;
    $waitstaff = 13;

    if ($dish_count > $base_dishes) {
        $extra_dishes = $dish_count - $base_dishes;
        $increment = 100;
        $increments = ceil($extra_dishes / $increment);

        $chefs += floor(0.5 * $increments);
        $coordinators += floor(0.2 * $increments);
        $waitstaff += floor(1.3 * $increments);
    }

    return [
        'chefs' => $chefs,
        'coordinators' => $coordinators,
        'waitstaff' => $waitstaff,
        'total_staff' => $chefs + $coordinators + $waitstaff
    ];
}
