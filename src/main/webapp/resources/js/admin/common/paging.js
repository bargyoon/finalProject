		
		(() =>{
		    
		     	
		     let pageState = URLSearch.get('page')
		     
		     document.querySelectorAll('.page-item').forEach(e =>{
		     		if(pageState == null) {
		     			if(e.dataset.page == 1) e.classList.add("active")
		     		}else if(pageState == e.dataset.page) {
		     			
		     			e.classList.add("active")
		     		}
		     	})
	    })();

		
		
		let prevBtn = (page) => {
			if(page == 1){
				alert("첫번째 페이지 입니다.")
				return;
			}
			
			page--;

			changePage(page);
			
		}
		
		let nextBtn = (page, blockEnd) => {
			if(page == blockEnd){
				alert("마지막 페이지 입니다.")
				return;
			}
			
			page++;
			
			changePage(page);
			
		}
	    let changePage = (page) =>{
	    	
	      		 URLSearch.set('page', String(page));
	         	 const newParam = URLSearch.toString();
	         	 location.href = location.pathname + '?' + newParam
	      	 
	    }