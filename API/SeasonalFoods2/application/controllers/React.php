<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class React extends CI_Controller {
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
	public function sellProducts(){
        $quantityData = json_decode(file_get_contents("php://input"), true);
        $quantity = $quantityData["quantity"];
        $querySell = "SELECT * from products LEFT JOIN discountcodedetail ON products.id = discountcodedetail.id_product LEFT JOIN discountcodeapply on discountcodedetail.id_code = discountcodeapply.id_discountcode where hidden=0 order by create_at desc limit ".$quantity;
        $data= $this->M_data->load_query($querySell);
        echo json_encode($data);
    }
    // new products
    public function newProducts(){
        $quantityData = json_decode(file_get_contents("php://input"), true);
        $quantity = $quantityData["quantity"];
        $queryNew = "SELECT * from products LEFT JOIN discountcodedetail ON products.id = discountcodedetail.id_product LEFT JOIN discountcodeapply on discountcodedetail.id_code = discountcodeapply.id_discountcode where hidden=0 order by create_at desc limit ".$quantity;
        $data = $this->M_data->load_query($queryNew);
        echo json_encode($data);
    }
    
    // login
    public function userLogin(){
        $inforUser = json_decode(file_get_contents("php://input"), true);
        $username = $inforUser["username"];
        $pass = $inforUser["password"];
        
        $query = "select * from accountcustomers where username='".$username."' and password = '".$pass."'";
        $data = $this->M_data->load_query($query);
        if(count($data) > 0){
            $arrUser["id"] = $data[0]["id_customer"];
            $arrUser['username'] = $data[0]['username'];
	
			echo json_encode($arrUser);
            exit();
        }
        echo 1;// tài khoản không tồn tại
        
    }
    public function bills(){
        $infor = json_decode(file_get_contents("php://input"), true);
        $id = $infor["id"];
        $query = "SELECT * FROM bills WHERE id_customer = '".$id."'";
        $bills = $this->M_data->load_query($query);
        echo json_encode($bills);
    }
    public function detailBill(){
        $infor = json_decode(file_get_contents("php://input"), true);
        $id = $infor["id"];
        $id_bill = $infor["id_bill"];
        $query = "select * from (SELECT * FROM detailbills,bills WHERE detailbills.id_bill = bills.id_bills and bills.id_bills = '".$id_bill."' and bills.id_customer = '".$id."') AS test LEFT JOIN products on products.id = test.id_product";
        $detailBill = $this->M_data->load_query($query);
        echo json_encode($detailBill);
    }
    public function customerInfo(){
        $infor = json_decode(file_get_contents("php://input"), true);
        $id = $infor["id"];
        $query = "select * from customers where id_customer = '".$id."'";
        $data = $this->M_data->load_query($query);
        echo json_encode($data);
    }
    public function updateCart(){
        $infor = json_decode(file_get_contents("php://input"),true);
        $cart = $infor["cart"];
        $allProduct = [];
        for($i = 0; $i < count($cart); $i++){
            
            $id = $cart[$i]["id"];
            $query = "SELECT * from products LEFT JOIN discountcodedetail ON products.id = discountcodedetail.id_product 
            LEFT JOIN discountcodeapply on discountcodedetail.id_code = discountcodeapply.id_discountcode 
            LEFT JOIN unit on products.id_unit = unit.id_units where products.id = '".$id."'";
            $product = $this->M_data->load_query($query);
            $quantity = array(
                "quantity" => $cart[$i]["quantity"]
            );
            array_push($product,$quantity);
            array_push($allProduct,$product);
        }
        echo json_encode($allProduct);
    }
    // product detail
    public function productDetail($id=""){
        $query = "select products.*, unitName from products, unit where products.id_unit = unit.id_units and products.id='".$id."'";
        $data = $this->M_data->load_query($query);
        echo json_encode($data);
    }
    public function filterProducts(){
        $data = json_decode(file_get_contents("php://input"), true);
        $portfolios = $data["portfolios"];
        $price = $data["price"];
        $search = $data["searchValue"];
        
        $query = "SELECT * from products LEFT JOIN discountcodedetail ON products.id = discountcodedetail.id_product LEFT JOIN discountcodeapply on discountcodedetail.id_code = discountcodeapply.id_discountcode LEFT JOIN portfolio ON products.id_por = portfolio.id_portfolio LEFT JOIN brand ON products.id_brand = brand.id_brands where hidden=0 and name like '%".$search."%'";
        $price = trim($price);
        
        $portfoliosArray = explode(",",$portfolios);
        
        if($portfolios != ""){
                $query .= " and (";
                for($i=0; $i<count($portfoliosArray); $i++){
                    if($i == count($portfoliosArray) - 1){
                        $query .= "id_por = ".$portfoliosArray[$i].")";
                    }
                    else{
                        $query .= "id_por = ".$portfoliosArray[$i]." or ";
                    }
                }
            }
        
        
        if($price != "default"){
            $query.= " order by price";
            if($price == "decrease"){
                $query.=" desc";
            }
            if($price == "increase"){
                $query.=" asc";
            }
        }
        $data  = $this->M_data->load_query($query);
        echo json_encode($data);
    }
    public function portfolios(){
        $queryPor = "select * from portfolio";
        $data = $this->M_data->load_query($queryPor);
        echo json_encode($data);
    }


}
