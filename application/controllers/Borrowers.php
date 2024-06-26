<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Borrowers extends CI_Controller
{

	public function check_auth()
	{
		if (!$this->session->userdata('logged_in')) {
			redirect(base_url());
		}
	}

	public function create_borrowers()
	{

		$this->check_auth('create_borrowers');

		$title['title'] = "LMS-Create Borrowers";

		//get last account_no of client
		$account_no = $this->borrowers_model->get_account_id();

		if (is_null($account_no)) {

			$clients['acc_no'] = 1000;

			$this->load->view('templates/header', $title);
			$this->load->view('borrowers/create_borrowers', $clients);
		} else {
			$clients['acc_no'] = array('account_no' => $account_no['account_no']);

			$this->load->view('templates/header', $title);
			$this->load->view('borrowers/create_borrowers', $clients);
		}
	}

	public function new_borrowers()
	{

		$this->check_auth('create_borrowers');

		$title['title'] = "LMS-New Borrowers";

		$clients['new_clients'] = $this->borrowers_model->get_new_clients();

		$this->load->view('templates/header', $title);
		$this->load->view('borrowers/new_borrowers', $clients);
	}

	public function active_borrowers()
	{

		$title['title'] = "LMS-Active Borrowers";

		$this->check_auth('active_borrowers');

		$clients['active'] = $this->borrowers_model->get_active_clients();

		$this->load->view('templates/header', $title);
		$this->load->view('borrowers/active_borrowers', $clients);
	}

	public function borrowers_profile($account_no)
	{

		$this->check_auth('borrowers_profile');

		$result = $this->borrowers_model->get_profile($account_no);

		if (!is_null($result)) {

			$business = $this->borrowers_model->get_profile_bname($account_no);

			if (!is_null($business)) {
				$client['business'] = array('bname' => $business['business_name'], 'baddress' => $business['business_address']);
			}


			$client['co_maker'] = $this->borrowers_model->get_co_maker($account_no);
			$client['loan'] = $this->borrowers_model->get_loan($account_no);

			$client['profile'] = array(
				'account_no' => $result['account_no'],
				'prof-img' => $result['profile_img'],
				'email' => $result['email'],
				'number1' => $result['number1'],
				'number2' => $result['number2'],
				'birthdate' => $result['birthdate'],
				'gender' => $result['gender'],
				'info' => $result['added_info'],
				'status' => $result['status'],
				'purok' => $result['purok_no'],
				'barangay' => $result['barangay'],
				'city' => $result['city'],
				'province' => $result['province'],
				'country' => $result['country'],
				'postal_code' => $result['postal_code'],
				'fname' => $result['firstname'],
				'mname' => $result['middlename'],
				'lname' => $result['lastname']
			);

			$title['title'] = "Profile-" . $result['firstname'] . ' ' . $result['middlename'] . ' ' . $result['lastname'];

			$this->load->view('templates/header', $title);
			$this->load->view('borrowers/profile', $client);
			// var_dump($client['loan']);

		} else {
			redirect(base_url('error404'));
		}
	}

	public function register_borrowers()
	{

		$validator = array('success' => false, 'messages' => array());

		$config['upload_path'] = './uploads/';
		$config['allowed_types'] = 'jpg|png|jpeg|gif';
		$config['encrypt_name'] = TRUE;
		$uploadDirectory = FCPATH . 'assets/uploads/';
		$allowedExtensions = array('jpg', 'png', 'jpeg', 'gif');

		$this->load->library('upload', $config);

		if (empty($_FILES['client_img']['tmp_name'])) {

			$client_data = array(
				'account_no' => $this->input->post('account_no'),
				'client_img' => "",
				'mname' => $this->input->post('mname'),
				'gname' => $this->input->post('gname'),
				'lname' => $this->input->post('lname'),
				'email' => $this->input->post('email'),
				'number1' => $this->input->post('number1'),
				'number2' => $this->input->post('number2'),
				'purok_no' => $this->input->post('purok_no'),
				'barangay' => $this->input->post('barangay'),
				'city' => $this->input->post('city'),
				'province' => $this->input->post('province'),
				'postal_code' => $this->input->post('postal_code'),
				'birthdate' => $this->input->post('birthdate'),
				'gender' => $this->input->post('inlineRadioOptions'),
				'info' => $this->input->post('info')
			);

			$insert_data = $this->borrowers_model->insert_client($client_data);

			if ($insert_data) {
				$validator['success'] = true;
				$validator['messages'] = 'Successfully added!';
			} else {

				$validator['success'] = false;
				$validator['messages'] = 'Something went wrong. Please contact the administrator';
			}
		} else {
			// Get file information
			$fileName = $_FILES['client_img']['name'];
			$fileTmpName = $_FILES['client_img']['tmp_name'];
			$fileSize = $_FILES['client_img']['size'];
			$fileError = $_FILES['client_img']['error'];

			// Check for file upload errors
			if ($fileError === 0) {
				$extension = pathinfo($fileName, PATHINFO_EXTENSION);

				if (in_array(strtolower($extension), $allowedExtensions)) {
					$newFileName = uniqid() . '.' . $extension;
					$uploadPath = $uploadDirectory . $newFileName;

					// Move uploaded file to destination
					if (move_uploaded_file($fileTmpName, $uploadPath)) {
						$validator['success'] = true;
						$validator['messages'][] = 'File uploaded successfully.';
					} else {
						$validator['messages'][] = 'Error occurred while moving the file.';
					}
				} else {
					$validator['messages'][] = 'Invalid file type. Allowed types: ' . implode(', ', $allowedExtensions);
				}
			} else {
				$validator['messages'][] = 'Error occurred during file upload: ' . $fileError;
			}




			$data = $this->upload->data();
			//Resize and Compress Image
			$config['image_library'] = 'gd2';
			$config['source_image'] = './uploads/' . $data['file_name'];
			$config['create_thumb'] = FALSE;
			$config['maintain_ratio'] = FALSE;
			$config['quality'] = '60%';
			$config['width'] = 600;
			$config['height'] = 400;
			$config['new_image'] = './uploads/' . $data['file_name'];

			$this->load->library('image_lib', $config);
			$this->image_lib->resize();


			$client_data = array(
				'account_no' => $this->input->post('account_no'),
				'client_img' => $newFileName,
				'mname' => $this->input->post('mname'),
				'gname' => $this->input->post('gname'),
				'lname' => $this->input->post('lname'),
				'email' => $this->input->post('email'),
				'number1' => $this->input->post('number1'),
				'number2' => $this->input->post('number2'),
				'purok_no' => $this->input->post('purok_no'),
				'barangay' => $this->input->post('barangay'),
				'city' => $this->input->post('city'),
				'province' => $this->input->post('province'),
				'postal_code' => $this->input->post('postal_code'),
				'birthdate' => $this->input->post('birthdate'),
				'gender' => $this->input->post('inlineRadioOptions'),
				'info' => $this->input->post('info')
			);

			$insert_data = $this->borrowers_model->insert_client($client_data);

			if ($insert_data) {
				$validator['success'] = true;
				$validator['messages'] = 'Successfully added!';
			} else {

				$validator['success'] = false;
				$validator['messages'] = 'Something went wrong. Please contact the administrator';
			}
		}

		echo json_encode($validator);
	}


	public function update_client()
	{
		$validator = array('success' => false, 'messages' => array());

		$config['upload_path'] = './uploads/';
		$config['allowed_types'] = 'jpg|png|jpeg|gif';
		$config['encrypt_name'] = TRUE;
		$uploadDirectory = FCPATH . 'assets/uploads/';
		$allowedExtensions = array('jpg', 'png', 'jpeg', 'gif');

		$this->load->library('upload', $config);

		// Check if a file is uploaded
		if (!empty($_FILES['client_img']['tmp_name'])) {
			$fileInfo = $_FILES['client_img'];

			// Check for file upload errors
			if ($fileInfo['error'] === UPLOAD_ERR_OK) {
				$extension = pathinfo($fileInfo['name'], PATHINFO_EXTENSION);
				var_dump($extension);
				exit;
				// Check if the file extension is allowed
				if (in_array(strtolower($extension), $allowedExtensions)) {
					$newFileName = uniqid() . '.' . $extension;
					$uploadPath = $uploadDirectory . $newFileName;

					// Move uploaded file to destination
					if (move_uploaded_file($fileInfo['tmp_name'], $uploadPath)) {
						$this->load->library('image_lib', $config);
						// Resize the uploaded image if needed
						$this->image_lib->resize();

						$validator['success'] = true;
						$validator['messages'][] = 'File uploaded successfully.';
					} else {
						$validator['messages'][] = 'Error occurred while moving the file.';
					}
				} else {
					$validator['messages'][] = 'Invalid file type. Allowed types: ' . implode(', ', $allowedExtensions);
				}
			} else {
				$validator['messages'][] = 'Error occurred during file upload: ' . $fileInfo['error'];
			}
		}

		// Update client data
		$client_data = array(
			'account_no' => $this->input->post('account_no'),
			'img' => isset($newFileName) ? $newFileName : '', // If a new file is uploaded, use its name; otherwise, keep the old image name
			'email' => $this->input->post('email'),
			'number1' => $this->input->post('num1'),
			'number2' => $this->input->post('num2'),
			'bday' => $this->input->post('bday'),
			'gender' => $this->input->post('gender'),
			'info' => $this->input->post('info')
		);

		$name = array(
			'account_no' => $this->input->post('account_no'),
			'mname' => $this->input->post('mname'),
			'fname' => $this->input->post('fname'),
			'lname' => $this->input->post('lname')
		);

		// Update client profile and name in the database
		$update_profile = $this->borrowers_model->update_profile($client_data);

		if ($update_profile) {
			$update_name = $this->borrowers_model->update_name($name);

			$validator['success'] = true;
			$validator['messages'] = 'Update successfully!';
		} else {
			$validator['messages'][] = "Something went wrong!";
		}

		echo json_encode($validator);
	}

	public function delete_clients()
	{
		$result = $this->borrowers_model->delete_clients($this->input->post('id'));
		if ($result) {
			echo "All client records has been deleted!";
		} else {
			echo "False";
		}
	}
}
