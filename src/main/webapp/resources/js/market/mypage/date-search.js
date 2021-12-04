//현재시간으로 설정
	document.getElementById('fromDate').valueAsDate = new Date();
	document.getElementById('endDate').valueAsDate = new Date();
	
	console.dir(document.getElementById('fromDate').valueAsDate);
	
	//최대, 최소 날짜 설정
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; // 1월은 0
	var yyyy = today.getFullYear();
	
	 if(dd<10){
	     dd='0'+dd
	  } 
	if(mm<10){
		 mm='0'+mm
	} 
	
	today = yyyy+'-'+mm+'-'+dd; // yyyy-mm-dd
	
	document.getElementById("fromDate").setAttribute("max", today);
	document.getElementById("endDate").setAttribute("max", today);
	
	function resetDate() {
		
		var fromDate = document.getElementById('fromDate').value;
		var endDate = document.getElementById('endDate').value;
		 var fromArray = fromDate.split('-');
         var endArray = endDate.split('-');   
         
         var start_date = new Date(fromArray[0], fromArray[1], fromArray[2]);
         var end_date = new Date(endArray[0], endArray[1], endArray[2]);
              //날짜를 숫자형태로 바꿔서 비교
         if(start_date.getTime() > end_date.getTime()) {
             alert("종료날짜보다 시작날짜가 작아야합니다.");
             return false;
		}
	
	}
	
	//radio button으로 기간 설정
	function setDate() {
		
		//라디오버튼
		var radioLength = document.getElementsByName('period').length;
		for (var i = 0; i < radioLength; i++) {
            if (document.getElementsByName("period")[i].checked == true) {
            	var radioBnt = document.getElementsByName("period")[i].value;
            	console.dir(radioBnt);
            }
        }
		
		var date = new Date();
		var dd = date.getDate();
		var mm = date.getMonth()+1; // 1월은 0
		var yyyy = date.getFullYear();
		
		if(radioBnt=="1"){ //일주일 
			if(dd<8){
				mm=mm-1;
				dd=24+dd;
			}else{
				dd=dd-7;		
			}			 	
			 if(dd<10){dd='0'+dd} 
			 if(mm<10){mm='0'+mm} 
			 date = yyyy+'-'+mm+'-'+dd; // yyyy-mm-dd
			 document.getElementById('fromDate').value = date;
			 document.getElementById('endDate').valueAsDate = new Date();
		}else if(radioBnt=="2"){ //한달
			if(mm==1){
				yyyy=yyyy-1;
				mm=12;
			}else{
				mm=mm-1;
			}			 
			 if(dd<10){dd='0'+dd} 
			 if(mm<10){mm='0'+mm} 
			 date = yyyy+'-'+mm+'-'+dd; 
			 document.getElementById('fromDate').value = date;
			 document.getElementById('endDate').valueAsDate = new Date();
		}else if(radioBnt=="3"){ //3개월
			if(mm<4){
				yyyy=yyyy-1;
				mm=9+mm;
			}else{
				mm=mm-3;
			}				 
			 if(dd<10){dd='0'+dd} 
			 if(mm<10){mm='0'+mm} 
			 date = yyyy+'-'+mm+'-'+dd;
			 document.getElementById('fromDate').value = date;
			 document.getElementById('endDate').valueAsDate = new Date();
		}
	}