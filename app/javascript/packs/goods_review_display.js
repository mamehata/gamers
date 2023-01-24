document.addEventListener('turbolinks:load', function() {
  let raty_elem_<%= goods_review.id %> = document.querySelector("#review_display<%= goods_review.id %>");
  raty_elem_<%= goods_review.id %>.innerHTML = "";
  let raty_opt_<%= goods_review.id %> = {
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
    score: '<%= goods_review.goods_rating %>'
  };
  raty(raty_elem_<%= goods_review.id %>,raty_opt_<%= goods_review.id %>);
});