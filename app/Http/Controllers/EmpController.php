<?php
	// Last Edited       : 2026-03-26
	// File name         : EmpController.php

	// Modul Description : Employee
	// Date              : 2022-01-20
	// Created by.       : yudhi irawan
	// Contact person    : IG: @iam.yudhi_irawan


	// MCG - Massive CRUD Generator Laravel-AdminLTE3-MySQL for Laravel 10 Up ver. Jan 2026-Free Version

	// Private message at Telegram        : @yudhi_irawan
	// Private activity feeds at Instagram: @iam.yudhi_irawan

	// Download Massive CRUD Generator on telegram and github link
	// MCG Application: https://t.me/MCGFreeVersion
	// Documentation  : https://yudhi-irawan.github.io/200-mcg-documentation/tutorial.html
	// Testing        : https://github.com/yudhi-irawan/052-mcg-laravel12-lte3
	// Template       : 

	// Donation and Support link
	// Ko-fi   : https://ko-fi.com/MassiveCrudGenerator
	// Trakteer: https://trakteer.id/MassiveCrudGenerator

	// Please follow us for information about new releases


namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\EmpModel;
use App\Models\SexModel;
use App\Models\EduModel;
use Dompdf\Dompdf;
use Dompdf\Options;
use Illuminate\Support\Str;

class EmpController extends Controller
{
	private static $SQL_one = 'select * from emp_one_view';	//two-1011
	private static $column_order_one = array(null, 'name', 'bday', 'sex_id', 'sex_description', 'edu_code', 'edu_description', 'alamat', 'kota', 'provinsi', 'goldarah', 'insertnew');	//three-776
	private static $column_search_one = array('name', 'bday', 'sex_id', 'sex_description', 'edu_code', 'edu_description', 'alamat', 'kota', 'provinsi', 'goldarah', 'insertnew');	//three-781
	private static $order_one = array('id' => 'asc');	//three-819

	public function getdata_one(Request $request)	//two-731
	{
		$dataTablesParams = $request->all();
		$startIndex = $dataTablesParams['start'];
		$draw = $dataTablesParams['draw'];

		$data = EmpModel::getdata_one($dataTablesParams, self::$SQL_one, self::$column_order_one, self::$column_search_one);

		$i = 0;
		$datarows = array();
		$no = $startIndex;
		foreach ($data['data'] as $row) {
			$no++;

			$arr_all=array_merge(
				['no' => $no],
				$row);
			array_push($datarows, $arr_all);
		}
		$output["draw"] = $draw;
		$output["recordsTotal"] = $data["count"];
		$output["recordsFiltered"] = $data["count_filtered"];
		$output["data"] = $datarows;
		echo json_encode($output);
	}

	public function index()	//two-454
	{
		$data = [
		    'title' => 'Employee',
		];
		$data['sex']  = json_decode(json_encode(SexModel::getForLookUp_one()), true);	//object to array
		$data['edu']  = json_decode(json_encode(EduModel::getForLookUp_one()), true);	//object to array
        return view('emp_index', $data);
	}

	public function savecreate_one(Request $request)	//store two-663
	{
		$messages = [
			'name.required' => 'Data NAMA harus diisi.',
			'alamat.required' => 'Data ALAMAT harus diisi.',
			'kota.required' => 'Data KOTA harus diisi.',
			'provinsi.required' => 'Data PROVINSI harus diisi.',
		];
		$validated = $request->validate([
			'name' => 'required',
			'alamat' => 'required',
			'kota' => 'required',
			'provinsi' => 'required',
		],$messages);
		$emp = EmpModel::savecreate_one([
			'name' => $request->name	//three-543
			,'bday' => $request->bday	//three-543
			,'sex_id' => $request->sex_id	//three-543
			,'edu_code' => $request->edu_code	//three-543
			,'alamat' => $request->alamat	//three-543
			,'kota' => $request->kota	//three-543
			,'provinsi' => $request->provinsi	//three-543
			,'goldarah' => $request->goldarah	//three-543
			,'insertnew' => $request->insertnew	//three-543
        ]);
        $emp_array = (array) $emp;
        $output = end($emp_array);
        return response()->json($output);	//{"status":"OK","ret_id":1}	//two-723
	}

	public function edit_one(Request $request)	//two-186
	{
		$id = $request->id;	//229
		$emp = EmpModel::find_one($id);
        $emp_array = (array) $emp;
        $output = end($emp_array);
        return response()->json($output);	//{"sex_id":2,"sex_name":"Perempuan","created_by":"","updated_by":""}	//two-295
	}

	public function saveedit_one(Request $request)	//update
	{
		$messages = [
			'name.required' => 'Data NAMA harus diisi.',
			'alamat.required' => 'Data ALAMAT harus diisi.',
			'kota.required' => 'Data KOTA harus diisi.',
			'provinsi.required' => 'Data PROVINSI harus diisi.',
		];
		$validated = $request->validate([
			'name' => 'required',
			'alamat' => 'required',
			'kota' => 'required',
			'provinsi' => 'required',
		],$messages);
		$emp = EmpModel::saveedit_one([
			'id' => $request->id	//three-517
			,'name' => $request->name	//three-543
			,'bday' => $request->bday	//three-543
			,'sex_id' => $request->sex_id	//three-543
			,'edu_code' => $request->edu_code	//three-543
			,'alamat' => $request->alamat	//three-543
			,'kota' => $request->kota	//three-543
			,'provinsi' => $request->provinsi	//three-543
			,'goldarah' => $request->goldarah	//three-543
			,'insertnew' => $request->insertnew	//three-543
        ]);
        $emp_array = (array) $emp;
        $output = end($emp_array);
        return response()->json($output);	//{"status":"OK","ret_id":1}	//two-471
	}

	public function delete_one(Request $request)	//delete
	{
		$id = $request->id;	//two-864
		$emp = EmpModel::savedelete_one($id);
        $emp_array = (array) $emp;
        $output = end($emp_array);
        return response()->json($output);	//{"status":"OK"}	//two-1088
	}

	public function get_from_parent_filter_one(Request $request)	//two-882
	{
		if($request->action)
		{
			$action = $request->action;
			if($action == 'id')
			{
				$filter = $request->filter;
				$data = EmpModel::where('id', $filter)->get();
				echo json_encode($data);
			}
			if($action == 'sex_id')
			{
				$filter = $request->filter;
				$data = EmpModel::where('sex_id', $filter)->get();
				echo json_encode($data);
			}
			if($action == 'edu_code')
			{
				$filter = $request->filter;
				$data = EmpModel::where('edu_code', $filter)->get();
				echo json_encode($data);
			}
		}
	}

	public function generatepdf_one(Request $request)	//two-1292
	{
		$ctitle = $request->query('title');
		$emp = EmpModel::getbyid_one();
		$data = [
		    'title' => $ctitle,
			'date' => date('m/d/Y'),
			'emp' => $emp
		];
		$html = view('emp_rpt', $data);
		$dompdf = new Dompdf();
		$dompdf->loadHtml($html);
		$dompdf->render();

		$canvas = $dompdf->getCanvas();
		$canvas->page_script(function ($pageNumber, $pageCount, $canvas, $fontMetrics) {
			$text = "Page $pageNumber of $pageCount";
			$font = $fontMetrics->getFont('courier');
			$pageWidth = $canvas->get_width();
			$pageHeight = $canvas->get_height();
			$size = 12;
			$width = $fontMetrics->getTextWidth($text, $font, $size);
			$canvas->text($pageWidth - $width - 20, $pageHeight - 20, $text, $font, $size);
			$canvas->text(35, 18, 'LIST EMP', $font, 12);
		});
		return $dompdf->stream('sample.pdf', array('Attachment'=>'0')); //to screen
	}

	public function testing(Request $request)
	{
		echo $request->todo;
	}

}
