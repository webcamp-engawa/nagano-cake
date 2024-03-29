// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery-ui/widgets/autocomplete
//= require_tree .

$(document).ready(function () {
  $("#theTarget").skippr({
      // スライドショーの変化 ("fade" or "slide")
      transition : 'slide',
      // 変化に係る時間(ミリ秒)
      speed : 2000,
      // easingの種類
      easing : 'ease-in-out',
      // ナビゲーションの形("block" or "bubble")
      navType : 'bubble',
      // 子要素の種類("div" or "img")
      childrenElementType : 'div',
      // ナビゲーション矢印の表示(trueで表示)
      arrows : false,
      // スライドショーの自動再生(falseで自動再生なし)
      autoPlay : true,
      // 自動再生時のスライド切替間隔(ミリ秒)
      autoPlayDuration : 3500,
      // キーボードの矢印キーによるスライド送りの設定(trueで有効)
      keyboardOnAlways : false,
      // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
      hidePrevious : false,
  });
});

$(function() {

  $('.menu-trigger').on('click', function() {
    $('body').toggleClass('active');
    $('#sp-menu').fadeToggle();
    return false;
  });

  $('.bg').on('click', function () {
    $('body').toggleClass('active');
    $('#sp-menu').fadeToggle();
  });

 });