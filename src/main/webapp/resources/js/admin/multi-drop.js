document.querySelectorAll(".drop-zone__input").forEach((inputElement) => {
    const dropZoneElement = inputElement.closest(".drop-zone");
   
    dropZoneElement.addEventListener("click", (e) => {
      inputElement.click();
    });
  
    inputElement.addEventListener("change", (e) => {
        console.dir(inputElement)
      if (inputElement.files.length) {
           Array.prototype.forEach.call(inputElement.files,(filesElement) =>{
               updateThumbnail(dropZoneElement, filesElement);
            });
            
      }
    });
  
    dropZoneElement.addEventListener("dragover", (e) => {
      e.preventDefault();
      dropZoneElement.classList.add("drop-zone--over");
    });
  
    ["dragleave", "dragend"].forEach((type) => {
      dropZoneElement.addEventListener(type, (e) => {
        dropZoneElement.classList.remove("drop-zone--over");
      });
    });
  
    dropZoneElement.addEventListener("drop", (e) => {
      e.preventDefault();
  
      if (e.dataTransfer.files.length) {
        inputElement.files = e.dataTransfer.files;
       
            Array.prototype.forEach.call(inputElement.files,(filesElement) =>{
                updateThumbnail(dropZoneElement, filesElement);
            })
       
       
       
      }
  
      dropZoneElement.classList.remove("drop-zone--over");
    });
  });
  
  /**
   * Updates the thumbnail on a drop zone element.
   *
   * @param {HTMLElement} dropZoneElement
   * @param {File} file
   */
  function updateThumbnail(dropZoneElement, file) {
    let thumbnailElement = '';
  
    // First time - remove the prompt
    if (dropZoneElement.querySelector(".drop-zone__prompt")) {
      dropZoneElement.querySelector(".drop-zone__prompt").style.display="none";
    }
    thumbnailElement = document.createElement("div");
    
    // First time - there is no thumbnail element, so lets create it
  
        thumbnailElement.classList.add("drop-zone__thumb");
        dropZoneElement.appendChild(thumbnailElement);
   
  
    thumbnailElement.dataset.label = file.name;
  
    // Show thumbnail for image files
    if (file.type.startsWith("image/")) {
      const reader = new FileReader();
  
      reader.readAsDataURL(file);
      reader.onload = () => {
        thumbnailElement.style.backgroundImage = `url('${reader.result}')`;
      };
    } else {
      thumbnailElement.style.backgroundImage = null;
    }
  }
  
  document.querySelector('#reset-img').addEventListener("click", e =>{
      let dropImg =  document.querySelector('.drop-img');
    if(dropImg.querySelector('.drop-zone__thumb')){
        document.querySelector('.img-1').type="text";
        document.querySelector('.img-1').type="file";
        dropImg.querySelector(".drop-zone__prompt").style.display=""
        dropImg.querySelectorAll('.drop-zone__thumb').forEach(e =>{
            e.remove();
        })
    }
    
  })
  document.querySelector('#reset-spec-img').addEventListener("click", e =>{
    let dropImg =  document.querySelector('.drop-spec-img');
  if(dropImg.querySelector('.drop-zone__thumb')){
      document.querySelector('.img-2').type="text";
      document.querySelector('.img-2').type="file";
      dropImg.querySelector(".drop-zone__prompt").style.display=""
      dropImg.querySelectorAll('.drop-zone__thumb').forEach(e =>{
        e.remove();
    })
  }
  
})
