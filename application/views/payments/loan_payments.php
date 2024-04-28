<body class="">
    <?php $this->load->view('loading_screen'); ?>
    <div class="wrapper ">

        <!-- Top NavBar -->
        <?php $this->load->view('navigation/sidebar'); ?>
        <!-- End of NavBar -->

        <div class="main-panel">

            <!-- Navbar -->
            <?php $this->load->view('navigation/topbar'); ?>
            <!-- End Navbar -->


            <div class="content">
                <div class="container-fluid">
                    <div class="row" style="margin-top: -50px;">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header border-bottom row">
                                    <div class="col-md-8">
                                        <h4 class=" font-weight-bold text-primary">Loan Information</h4>
                                    </div>
                                    <?php if ($loan['loan_stats'] == 'Paid') { ?>
                                        <div class="col-md-2 text-right">
                                            <button class="btn btn-outline-primary btn-round pull-right btn-sm" data-target="#payment-modal" data-toggle="modal" disabled=""><i class="material-icons">monetization_on</i> Pay Loan</button>
                                        </div>

                                        <div class="col-md-1 text-right">
                                            <button rel="tooltip" title="Applicable only if loan is in due date" class="btn btn-outline-primary btn-round pull-right btn-sm" disabled="">Fully Paid</button>
                                        </div>

                                    <?php } else { ?>
                                        <div class="col-md-2 text-right">
                                            <button class="btn btn-outline-primary btn-round pull-right btn-sm" data-target="#payment-modal" data-toggle="modal"><i class="material-icons">monetization_on</i> Pay Loan</button>
                                        </div>

                                        <div class="col-md-1 text-right">
                                            <?php
                                            if (!empty($loan['due_date'])) {


                                                $due = date('M. d, Y', strtotime($loan['due_date']));
                                                $now = date('M. d, Y');

                                                if (strtotime($due) >= strtotime($now)) { ?>
                                                    <button rel="tooltip" title="Applicable only if loan is in due date" class="btn btn-outline-primary btn-round pull-right btn-sm" disabled="">Fully Paid</button>
                                                <?php } else { ?>
                                                    <button class="btn btn-outline-primary btn-round pull-right btn-sm fully_paid" id="<?php echo $loan['loan_no']; ?>">Fully Paid</button>
                                                <?php }
                                            } else { ?>
                                                <button class="btn btn-outline-primary btn-round pull-right btn-sm fully_paid" id="<?php echo $loan['loan_no']; ?>">Fully Paid</button>

                                            <?php } ?>
                                        </div>

                                    <?php } ?>

                                </div>
                                <div class="card-body">
                                    <div class="row">

                                        <div class="col-md-4 card-loan">
                                            <div class="fileinput-new thumbnail img-raised" style="width: 250px;">
                                                <?php if (empty($loan['profile_img'])) { ?>
                                                    <img class="border-round" src="<?php echo base_url() . 'assets/images/person.png' ?>" width="250" />
                                                <?php } else { ?>
                                                    <img class="img-fluid" width="250" id="output" src="<?php echo base_url() . 'assets/uploads/' . $loan['profile_img']; ?>" alt="client-img" />
                                                <?php } ?>
                                            </div>
                                        </div>

                                        <div class="col-md-8">
                                            <div class="row">
                                                <div class="col-md-4 p-0">
                                                    <div class="form-group input-group-prepend">
                                                        <label class="bmd-label-floating text-primary">Account Number:</label>
                                                        <input type="text" class="form-control interest text-left font-weight-bold" value="<?php echo $loan['account_no']; ?>" disabled>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 p-0">
                                                    <div class="form-group input-group-prepend">
                                                        <label class="bmd-label-floating text-primary">Loan No.:</label>
                                                        <input type="text" class="form-control interest text-left font-weight-bold" value="<?php echo $loan['loan_no']; ?>" disabled>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 p-0">
                                                    <div class="form-group input-group-prepend">
                                                        <label class="bmd-label-floating text-primary">Date Loan:</label>
                                                        <input type="text" class="form-control interest text-left font-weight-bold" value="<?php

                                                                                                                                            if (!empty($loan['due_date'])) {
                                                                                                                                                $time = strtotime($loan['loan_started']);
                                                                                                                                                echo date("M. d, Y", $time);
                                                                                                                                            } else {
                                                                                                                                                echo 'No Cash Release';
                                                                                                                                            }
                                                                                                                                            ?>" disabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row p-0">
                                                <div class="col-md-12 p-0">
                                                    <div class="form-group input-group-prepend">
                                                        <label class="bmd-label-floating text-primary">Client's Name: </label>
                                                        <input type="text" class="form-control interest text-left font-weight-bold" value="<?php echo $loan['firstname'] . ' ' . $loan['middlename'] . '. ' . $loan['lastname']; ?>" disabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row p-0">
                                                <div class="col-md-12 p-0">
                                                    <div class="form-group input-group-prepend">
                                                        <label class="bmd-label-floating text-primary">Current Address: </label>
                                                        <input type="text" class="form-control interest text-left font-weight-bold" value="Purok <?php echo $loan['purok_no'] . ', ' . $loan['barangay'] . ', ' . $loan['city'] . ', ' . $loan['province'] . ', ' . $loan['country'] . ' ' . $loan['postal_code']; ?>" disabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row p-0">
                                                <div class="col-md-6 p-0">
                                                    <div class="form-group input-group-prepend">
                                                        <label class="bmd-label-floating text-primary">Amount Loan: </label>
                                                        <input type="text" class="form-control interest text-left font-weight-bold" value="<?php echo $loan['loan_amount']; ?>" disabled>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 p-0">
                                                    <div class="form-group input-group-prepend">
                                                        <label class="bmd-label-floating text-primary">Date Due: </label>
                                                        <input type="text" class="form-control interest text-left font-weight-bold" value="<?php

                                                                                                                                            if (!empty($loan['due_date'])) {
                                                                                                                                                $due = $loan['due_date'];
                                                                                                                                                echo date('M. d, Y', strtotime($due));
                                                                                                                                            } else {
                                                                                                                                                echo 'No Cash Release';
                                                                                                                                            }


                                                                                                                                            ?>" disabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row p-0">
                                                <div class="col-md-6 p-0">
                                                    <div class="form-group input-group-prepend">
                                                        <label class="bmd-label-floating text-primary">Payment(P) : </label>
                                                        <input type="text" class="form-control interest text-left font-weight-bold" value="<?php echo $loan['daily_payment']; ?>" disabled>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 p-0">
                                                    <div class="form-group input-group-prepend">
                                                        <label class="bmd-label-floating text-primary">Terms: </label>
                                                        <input type="text" class="form-control interest text-left font-weight-bold" value="<?php echo $loan['terms']; ?> " disabled>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 p-0">
                                                    <div class="form-group input-group-prepend">
                                                        <label class="bmd-label-floating text-primary">Collector: </label>
                                                        <input type="text" class="form-control interest text-left font-weight-bold" value="<?php echo $loan['collector']; ?> " disabled>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-5">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">List of Payed Payment</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-sm">
                                    <thead class="text-primary">
                                        <th>No</th>
                                        <th>Date</th>
                                        <th>Amount</th>
                                        <th>Note</th>
                                        <th>Month Payed</th>
                                    </thead>
                                    <tbody>
                                        <?php
                                        // Initialize totalAmount before the loop
                                        $totalAmount = 0;

                                        // Iterate through payments to calculate totalAmount
                                        if (!empty($first_mnth)) {
                                            for ($i = 0; $i < count($first_mnth); $i++) {
                                                if (!empty($first_mnth[$i]['payment_no'])) {
                                                    $p = $first_mnth[$i]['payment_no'];
                                                }
                                                if (!empty($first_mnth[$i]['date'])) {
                                                    $d = $first_mnth[$i]['date'];
                                                }
                                                if (!empty($first_mnth[$i]['amount'])) {
                                                    $am = $first_mnth[$i]['amount'];

                                                    // Add the amount to totalAmount
                                                    $totalAmount += $am;
                                                }
                                                if (!empty($first_mnth[$i]['notes'])) {
                                                    $n = $first_mnth[$i]['notes'];
                                                }
                                                if (!empty($first_mnth[$i]['payment_month'])) {
                                                    $pm = $first_mnth[$i]['payment_month'];
                                                }
                                                $a = $i + 1;
                                        ?>
                                                <tr>
                                                    <td><?php echo $p; ?></td>
                                                    <td><?php echo $d; ?></td>
                                                    <td><?php echo $am; ?></td>
                                                    <td><?php
                                                        if ($n == "Penalty added") {
                                                            echo "<span class='text-danger'>" . $n . "</span>";
                                                        } else {
                                                            echo "<span class='text-success'>" . $n . "</span>";
                                                        } ?></td>
                                                    <td><?php echo $pm; ?></td>
                                                </tr>
                                            <?php }
                                        } else {
                                            for ($i = 1; $i <= 30; $i++) { ?>
                                                <tr>
                                                    <td><?php echo $i; ?></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                        <?php }
                                        } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-5 p-0">
                    <div class="form-group input-group-prepend">
                        <label class="bmd-label-floating text-primary">Remaining Balance</label>
                        <span class="input-group-text">₱</span>
                        <?php
                        $remainingBalance = isset($loan['loan_amount']) ? $loan['loan_amount'] - $totalAmount : 0;
                        ?>
                        <input type="text" class="form-control pl-3 font-weight-bold" value="<?php echo number_format($remainingBalance, 2); ?>" readonly>
                    </div>
                </div>

                <!-- <div class="col-md-5">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">All Payments</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-sm">
                                                    <thead class="text-primary">
                                                        <th>Month</th>
                                                        <th>Payment Date</th>
                                                        <th>Monthly Amount</th>
                                                        <th>Note</th>
                                                    </thead>
                                                    <tbody>
                                                        <?php
                                                        // Assuming $monthlyPayment is the monthly payment amount
                                                        $monthlyPayment = $loan['daily_payment'] * 30; // Assuming 30 days in a month

                                                        // Calculate the total number of months between the loan start date and due date
                                                        $loanStartDate = new DateTime($loan['loan_started']);
                                                        $dueDate = new DateTime($loan['due_date']);
                                                        $interval = $dueDate->diff($loanStartDate);
                                                        $totalMonths = $interval->format('%m');

                                                        // Display rows for each month
                                                        for ($i = 0; $i <= $totalMonths; $i++) {
                                                            $paymentDate = $loanStartDate->format('M. Y');
                                                            $loanStartDate->modify('+1 month');

                                                            // Add your logic to determine if a payment is expected in this month
                                                            // For example, you can check if it's the first month, second month, etc.
                                                            $isPaymentExpected = true;

                                                            // Display the table row
                                                            echo '<tr>';
                                                            echo '<td>' . ($i + 1) . '</td>';
                                                            echo '<td>' . $paymentDate . '</td>';
                                                            echo '<td>' . ($isPaymentExpected ? $monthlyPayment : '0.00') . '</td>';
                                                            echo '<td>' . ($isPaymentExpected ? 'Payment expected' : '') . '</td>';
                                                            echo '</tr>';
                                                        }
                                                        ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div> -->

                <!-- Modal  -->
                <div class="modal fade " id="payment-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog modal-md" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title font-weight-bold" id="exampleModalLabel">Transactions</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="ml-auto mr-auto">
                                            <button class="btn btn-primary norm_payment">Payment</button>
                                            <!-- Disable penalty button -->
                                            <?php
                                            if (!is_null($pny)) {
                                                $d = 0;
                                                if (!empty($pny[0]['date'])) {
                                                    $d = $pny[0]['date'];
                                                }
                                                $now = time();
                                                $date = strtotime($d);
                                                $datediff = $now - $date;

                                                $payment_no = round($datediff / (60 * 60 * 24));

                                                if ($payment_no >= 2) {
                                                    echo '<button class="btn btn-primary add_penalty">Add Penalty</button>';
                                                }
                                            }
                                            ?>
                                        </div>
                                    </div>
                                    <!-- Dropdown for selecting payment month -->
                                    <div class="dropdown">
                                        <button class="btn btn-secondary dropdown-toggle" type="button" id="payment_month" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Select Month
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="monthDropdown">
                                            <a class="dropdown-item" href="#" data-month="January">January</a>
                                            <a class="dropdown-item" href="#" data-month="February">February</a>
                                            <a class="dropdown-item" href="#" data-month="March">March</a>
                                            <a class="dropdown-item" href="#" data-month="April">April</a>
                                            <a class="dropdown-item" href="#" data-month="May">May</a>
                                            <a class="dropdown-item" href="#" data-month="June">June</a>
                                            <a class="dropdown-item" href="#" data-month="July">July</a>
                                            <a class="dropdown-item" href="#" data-month="August">August</a>
                                            <a class="dropdown-item" href="#" data-month="September">September</a>
                                            <a class="dropdown-item" href="#" data-month="October">October</a>
                                            <a class="dropdown-item" href="#" data-month="November">November</a>
                                            <a class="dropdown-item" href="#" data-month="December">December</a>
                                        </div>
                                    </div>

                                    <script>
                                        // JavaScript to update dropdown button text when a month is selected
                                        document.querySelectorAll('.dropdown-item').forEach(item => {
                                            item.addEventListener('click', event => {
                                                const selectedMonth = event.target.dataset.month;
                                                document.getElementById('payment_month').textContent = selectedMonth;
                                            });
                                        });
                                    </script>


                                    <div class="form-group mt-4">
                                        <label class="bmd-label-floating">Date Now</label>
                                        <input type="text" class="form-control pl-3" value="<?php echo date('M d, Y'); ?>">
                                    </div>
                                    <?php if (!is_null($pny)) { ?>
                                        <div class="form-group pnalty" style="display: none;">
                                            <label class="bmd-label-floating">Last Payment Date</label>
                                            <input type="text" class="form-control pl-3 " value="<?php
                                                                                                    if (!empty($pny[0]['date'])) {
                                                                                                        $time = strtotime($pny[0]['date']);
                                                                                                        echo date('M d, Y', $time);
                                                                                                    } ?>" readonly>
                                        </div>
                                    <?php } ?>
                                    <div class="form-group input-group-prepend">
                                        <span class="input-group-text">
                                            ₱
                                        </span>
                                        <label class="bmd-label-floating">Daily Payment</label>
                                        <input type="number" class="form-control pl-3 daily_payment" name="amount" value="<?php echo $loan['daily_payment']; ?>" readonly required>
                                    </div>
                                    <?php if (!is_null($pny)) { ?>
                                        <div class="form-group input-group-prepend pnalty" style="display: none;">
                                            <span class="input-group-text">
                                                %
                                            </span>
                                            <label class="bmd-label-floating">Penalty Percentage</label>
                                            <input type="number" class="form-control pl-3" name="amount" value="1" readonly required>
                                        </div>

                                        <div class="form-group input-group-prepend pnalty" style="display: none;">
                                            <span class="input-group-text">
                                                ₱
                                            </span>
                                            <label class="bmd-label-floating">Total Payment</label>
                                            <input type="number" class="form-control pl-3 total_pay" name="amount" value="<?php echo $penalty; ?>" readonly required>
                                        </div>
                                    <?php } ?>
                                    <input type="hidden" class="form-control loan_no" value="<?php echo $loan['loan_no']; ?>">
                                </div>
                                <button type="button" class="btn btn-primary btn-round btn-sm ml-3 pay">Pay</button>
                                <button type="button" class="btn btn-primary btn-round btn-sm ml-3 pay-penalty pnalty" style="display: none">Pay</button>

                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- End of modal -->
            </div>
        </div>
    </div>
    </div>
    <?php $this->load->view('templates/change_pass') ?>
    <?php $this->load->view('templates/footer') ?>
</body>