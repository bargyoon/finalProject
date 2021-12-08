(() =>{
		     let loadState = URLSearch.get('state')
		     	document.querySelectorAll('.tab').forEach(e =>{
		     		if(loadState == null) {
		     			document.querySelector(".tab_all").id = "clickedTab"
		     		}else if(loadState == e.dataset.tab) e.id = "clickedTab"
		     	})
	     })();
	    
	    let selectTab = (state,res) =>{
	    	 if(location.search.includes(state)){
	    		
	    		 URLSearch.set(state, String(res));
	       	 	 const newParam = URLSearch.toString();
	       	 	 location.href = location.pathname + '?' + newParam
	    	 }else{
	    		location.href = location.pathname+'?'+state+'='+res
	    	}
	    	  
	     }
	     
let deleteCheckList = (url) =>{
	let checkArr = []
	document.querySelectorAll(".listCheckbox").forEach(e =>{
		if(e.checked) checkArr.push(e.value);
		
	})
 		if(checkArr.length == 0){
 			alert("선택된 상품이 없습니다.")
 			return;
 		}
    	return fetch('/admin/'+url,{
 			method:"post",
 			body: JSON.stringify(checkArr),
 			 headers:{
 			    'Content-Type': 'application/json'
 			  }
    	}).then(res => {
    		alert('삭제가 완료되었습니다.');
    		location.replace(location.href);
    	})
    		
 	
 	}
