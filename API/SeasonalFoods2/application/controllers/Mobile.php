<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mobile extends CI_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');	
        $this->load->model('M_data');
		$this->load->library('session');
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
        $method = $_SERVER['REQUEST_METHOD'];
        if($method == "OPTIONS") {
            die();
        }
	}
	public function index()
	{
		echo "Hello";
	}
	// ------------------------------ login ----------------------
    public function login(){
        $username = $this->input->post("username");
       $pass = $this->input->post("password");
       
       $query = "select * from accountcustomers where username='".$username."' and password = '".$pass."'";
       $data = $this->M_data->load_query($query);
       if(count($data) > 0){
           $id = $data[0]["id_customer"];
			echo $id;
           exit();
       }
       echo -1;// tài khoản không tồn tại
        
    }
    //-------------------------- get tên khách hàng ---------------------------
    public function getCustomerName($id=""){
      $query = "select cusName from customers where id_customer = '".$id."'";
      $name = $this->M_data->load_query($query);
      echo $name[0]["cusName"];
    }
    //-------------------------- get customer infor ----------------------------
    //-------------------------- get customer bills ---------------------------
    public function getCustomerBill($id=""){
      $query = "select * from bills where id_customer = '".$id."'";
      $data = $this->M_data->load_query($query);
       echo json_encode($data);
    }
    //-------------------------- get detail bill -------------------------------


}
