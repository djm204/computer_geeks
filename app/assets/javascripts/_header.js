

function onLoad()
{	
	var search_mode     = document.getElementById('search_mode');

  search_mode.addEventListener('change', toggleSelect, false);
}

function toggleSelect()
{
	var search_mode     = document.getElementById('search_mode');
  var search_category = document.getElementById('search_category');
	
	if(search_mode.value == '1')
	{
		search_category.style.display = "none";
	}
	else
	{
		search_category.style.display = "inline";
	}
}

document.addEventListener("DOMContentLoaded", onLoad, false);