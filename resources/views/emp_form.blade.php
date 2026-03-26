<!-- two-966 -->
<div id="modal_one" class="modal fade" aria-labelledby="formtitle_one" data-bs-backdrop="static" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">
			<div class="card card-primary">
				<div class="card-header">
					<h3 class="card-title" id="formtitle_one">Emp</h3>
					<div class="card-tools">
						<button type="button" class="btn btn-tool" data-dismiss="modal" title="Close">
							<i class="fas fa-times"></i>
						</button>
					</div>
				</div>
				<form id="form_one" action="#" method="POST" enctype="multipart/form-data">
					@csrf
					<input type="hidden" name="id" id="id">
					<div class="modal-body p-4 bg-light">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="name">Emp Name</label>
									<!-- three-1848 -->
									<input type="text" class="form-control" id="name" name="name" placeholder="Enter Emp Name" autofocus>
									<div class="invalid-feedback" id="nameError"></div>
								</div>
								<div class="form-group">
									<label for="bday">Birth Day</label>
									<!-- three-1848 -->
									<input type="text" class="form-control" id="bday" name="bday" placeholder="Enter data with format yyyy-mm-dd" value="<?= old('bday', '2000-01-31'); ?>">
									<div class="invalid-feedback" id="bdayError"></div>
								</div>
								<div class="form-group">
									<label for="sex_id">Sex ID</label>
									<!-- three-1662 -->
									<select id="sex_id" name="sex_id" class="form-control select2">
										<option value="">-Select Tabel Sex-</option>
										<?php foreach($sex as $row):?>
										<option value="<?= $row['id'];?>"><?= $row['description'];?></option>
										<?php endforeach;?>
									</select>
								</div>

								<div class="form-group">
									<label for="edu_code">Edu Code</label>
									<!-- three-1742 -->
									<select id="edu_code" name="edu_code" class="form-control select2">
										<option value="">-Select Table Education Level-</option>
										<?php foreach($edu as $row):?>
										<option value="<?= $row['code'];?>"><?= $row['description'];?></option>
										<?php endforeach;?>
									</select>
								</div>
								<div class="form-group">
									<label for="alamat">Alamat</label>
									<!-- three-1848 -->
									<input type="text" class="form-control" id="alamat" name="alamat" placeholder="Enter Alamat">
									<div class="invalid-feedback" id="alamatError"></div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="kota">Kota</label>
									<!-- three-1848 -->
									<input type="text" class="form-control" id="kota" name="kota" placeholder="Enter Kota">
									<div class="invalid-feedback" id="kotaError"></div>
								</div>
								<div class="form-group">
									<label for="provinsi">Provinsi</label>
									<!-- three-1848 -->
									<input type="text" class="form-control" id="provinsi" name="provinsi" placeholder="Enter Provinsi">
									<div class="invalid-feedback" id="provinsiError"></div>
								</div>
								<div class="form-group">
									<label for="goldarah">Golongan Darah</label>
									<!-- three-2020 -->
									<select id="goldarah" name="goldarah" class="form-control select2">
										<option value="">-Select -</option>
										<option value="-">-</option>
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="AB">AB</option>
										<option value="O">O</option>
									</select>
								</div>
								<div class="form-group">
									<label for="insertnew">Insert Words</label>
									<!-- three-2020 -->
									<select id="insertnew" name="insertnew" class="form-control select2">
										<option value="">-Select -</option>
										<option value="-">-</option>
										<option value="Line-1">Line-1</option>
										<option value="Line-2">Line-2</option>
										<option value="Line3">Line3</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
						<button id="btn_save_one" type="submit" class="btn btn-primary">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
