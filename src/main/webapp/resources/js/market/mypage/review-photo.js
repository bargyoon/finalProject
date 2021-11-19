let readImage = (input) => {
    if(input.files) {
        const previewImgs = document.getElementById("preview_imgs");

        //이미지 업로드시 자식노드들 삭제
        if(previewImgs.hasChildNodes()){
            while(previewImgs.firstChild){
                previewImgs.removeChild(previewImgs.firstChild);
            }
        }
        //자식이 될 img노드 생성후 src 부여
        for (let i = 0; i < 3; i++) {
            let reader = new FileReader();

            reader.onload = e => {
                let imgNode = document.createElement("img");
                imgNode.className = "preview_img";
                imgNode.src = e.target.result;
                previewImgs.append(imgNode);
            }
            reader.readAsDataURL(input.files[i]);
        }
    }
}

document.getElementById("input_img").addEventListener("change", e => {
    readImage(e.target);
})