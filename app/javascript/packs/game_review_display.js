document.addEventListener('turbolinks:load', function() {
  for (i = 0; i < gon.review_ids.length; i++){
    let raty_elem = document.querySelector("#review_display" + gon.review_ids[i]);
    raty_elem.innerHTML = "";
    let raty_opt = {
      size: 30,
      starOff: "/assets/star-off.png",
      starOn: "/assets/star-on.png",
      starHalf: "/assets/star-half.png",
      half: true,
      hints: [
        ['1/2 bad', 'bad'],
        ['1/2 poor', 'poor'],
        ['1/2 regular', 'regular'],
        ['1/2 good', 'good'],
        ['1/2 gorgeous', 'gorgeous'],
      ],
      readOnly: true,
      score: gon.review_ratings[i]
    };
    raty(raty_elem,raty_opt);
  }
});