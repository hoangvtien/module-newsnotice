<!-- BEGIN: main -->
<p>{BLOCK_DATA.text}</P>
<form class="form-inline" action="{ACTION}" method="post">
	<input class="form-control" type="text" name="email" id="{MODULE_NAME}_email" style="width: 238px" /> <input class="btn btn-primary" type="submit" value="&gt;&gt;" name="do" />
</form>

<script type="text/javascript">
	$(document).ready(function(){
		$('input[name=do]').click(function(){
			var nv_mailfilter  = /^[_\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\.)+[a-z]{2,6}$/;
			var email = $('input[name=email]').val();

			if( email == '' )
			{
				alert('{LANG.error_email_empty}');
				$('#{MODULE_NAME}_email').focus();
				return false;
			}

			if( ! nv_mailfilter.test( email ) )
			{
				alert('{LANG.error_email_type}');
				$('#{MODULE_NAME}_email').focus();
				return false;
			}

			$.ajax({
		        type: "get",
		        url: '{NV_BASE_SITEURL}' + 'index.php?' + '{NV_NAME_VARIABLE}=newsnotice&{NV_OP_VARIABLE}=checkmail',
		        data: "email=" + email,
		        success: function (a) {
		        	if( a > 0 )
		        	{
		        		alert('{LANG.error_existed_email}');
		        		$('#{MODULE_NAME}_email').focus();
		        	}
		        	else
		        	{
		        		window.location.href = '{NV_BASE_SITEURL}' + 'index.php?' + '{NV_NAME_VARIABLE}=newsnotice&status=success&email=' + email;
		        	}
				}
			});
			return false;
		});
	});
</script>
<!-- END: main -->