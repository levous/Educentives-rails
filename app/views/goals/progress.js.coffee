$('#progress-chart-cntr')
  .html('<%= escape_javascript(render '/assessments/progress_chart')%>')
  .hide()
  .fadeIn()

