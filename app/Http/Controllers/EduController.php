<?php
	// Last Edited       : 2026-03-27
	// File name         : EduController.php

	// Modul Description : Table Education Level
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
use App\Models\EduModel;
use Dompdf\Dompdf;
use Dompdf\Options;
use Illuminate\Support\Str;

class EduController extends Controller
{
	private static $SQL_one = 'select * from edu_one_view';	//two-1011
	private static $column_order_one = array(null, 'code', 'description');	//three-776
	private static $column_search_one = array('code', 'description');	//three-781
	private static $order_one = array('id' => 'asc');	//three-819

	public function getdata_one(Request $request)	//two-731
	{
		$dataTablesParams = $request->all();
		$startIndex = $dataTablesParams['start'];
		$draw = $dataTablesParams['draw'];

		$data = EduModel::getdata_one($dataTablesParams, self::$SQL_one, self::$column_order_one, self::$column_search_one);

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
		    'title' => 'Table Education Level',
		];
        return view('edu_index', $data);
	}

	public function savecreate_one(Request $request)	//store two-663
	{
		$messages = [
			'code.required' => 'Data required.',
			'description.required' => 'Data required.',
		];
		$validated = $request->validate([
			'code' => 'required',
			'description' => 'required',
		],$messages);
		$edu = EduModel::savecreate_one([
			'code' => $request->code	//three-543
			,'description' => $request->description	//three-543
        ]);
        $edu_array = (array) $edu;
        $output = end($edu_array);
        return response()->json($output);	//{"status":"OK","ret_id":1}	//two-723
	}

	public function edit_one(Request $request)	//two-186
	{
		$id = $request->id;	//229
		$edu = EduModel::find_one($id);
        $edu_array = (array) $edu;
        $output = end($edu_array);
        return response()->json($output);	//{"sex_id":2,"sex_name":"Perempuan","created_by":"","updated_by":""}	//two-295
	}

	public function saveedit_one(Request $request)	//update
	{
		$messages = [
			'code.required' => 'Data required.',
			'description.required' => 'Data required.',
		];
		$validated = $request->validate([
			'code' => 'required',
			'description' => 'required',
		],$messages);
		$edu = EduModel::saveedit_one([
			'id' => $request->id	//three-517
			,'code' => $request->code	//three-543
			,'description' => $request->description	//three-543
        ]);
        $edu_array = (array) $edu;
        $output = end($edu_array);
        return response()->json($output);	//{"status":"OK","ret_id":1}	//two-471
	}

	public function delete_one(Request $request)	//delete
	{
		$id = $request->id;	//two-864
		$edu = EduModel::savedelete_one($id);
        $edu_array = (array) $edu;
        $output = end($edu_array);
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
				$data = EduModel::where('id', $filter)->get();
				echo json_encode($data);
			}
		}
	}

	public function generatepdf_one(Request $request)	//two-1292
	{
		$ctitle = $request->query('title');
		$edu = EduModel::getbyid_one();
		$data = [
		    'title' => $ctitle,
			'date' => date('m/d/Y'),
			'edu' => $edu
		];
		$html = view('edu_rpt', $data);
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
			$canvas->text(35, 18, 'LIST EDU', $font, 12);
		});
		return $dompdf->stream('sample.pdf', array('Attachment'=>'0')); //to screen
	}

	public function testing(Request $request)
	{
		echo $request->todo;
	}

}
