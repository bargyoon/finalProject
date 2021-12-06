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