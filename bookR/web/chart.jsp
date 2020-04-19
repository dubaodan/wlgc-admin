<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<H1 align="center">销量统计</H1>
    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    年：<input type="text" id = "inp1" VALUE=0>
    月：<input type="text" id = "inp2" VALUE=0>
    <button id="subbtn1" class="btn btn-default">按年搜索</button>
    <button id="subbtn2" class="btn btn-default">按月搜索</button>
    <div id="scale" style="width: 1000px;height:800px;"></div>
    <div id="number" style="width: 1000px;height:800px;"></div>

    <!-- 引入 ECharts 文件 -->
    <script src="https://cdn.bootcss.com/echarts/4.2.1-rc1/echarts.js"></script>
    <script src= "https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
         // 基于准备好的dom，初始化echarts实例
         //处理集合中的数据

       
           $("#subbtn1").click(function(){
        	   var myChart1 = echarts.init(document.getElementById('number'));
               var myChart2 = echarts.init(document.getElementById('scale'));
                var inp1= document.getElementById('inp1');
                
                option1 = {
                        legend: {},
                        tooltip: {
                            trigger: 'axis',
                        },
                        dataset: {
                            source: [
                            ]
                        },
                        xAxis: {type: 'category'},
                        yAxis: {
                        	name:'元',
                        	gridIndex: 0},
                        grid: {top: '55%'},
                        series: [
                            {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                            {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                            {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                            {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                            {
                                type: 'pie',
                                id: 'pie',
                                radius: '30%',
                                center: ['50%', '25%'],
                                label: {
                                    formatter: '{b}: {@1} ({d}%)'
                                },
                                encode: {
                                    itemName: 'product',
                                    value: '1',
                                    tooltip: '1'
                                }
                            }
                        ]
                    };
                  myChart1.on('updateAxisPointer', function (event) {
                        var xAxisInfo = event.axesInfo[0];
                        if (xAxisInfo) {
                            var dimension = xAxisInfo.value + 1;
                            myChart1.setOption({
                                series: {
                                    id: 'pie',
                                    label: {
                                        formatter: '{b}: {@[' + dimension + ']} ({d}%)'
                                    },
                                    encode: {
                                        value: dimension,
                                        tooltip: dimension
                                    }
                                }
                            });
                        }
                    });
                
                
                
                option2 = {
                	    color: ['#3398DB'],
                	    tooltip : {
                	        trigger: 'axis',
                	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                	        }
                	    },
                	    grid: {
                	        left: '3%',
                	        right: '4%',
                	        bottom: '3%',
                	        containLabel: true
                	    },
                	    xAxis : [
                	        {
                	            type : 'category',
                	            data : [],
                	            axisTick: {
                	                alignWithLabel: true
                	            }
                	        }
                	    ],
                	    yAxis : [
                	        {
                	        	name:'元',
                	            type : 'value'
                	        }
                	    ],
                	    series : [
                	        {
                	            name:'总营业额',
                	            type:'bar',
                	            barWidth: '60%',
                	            data:[],
                            markPoint : {
                                data : [
                                    {type : 'max', name: '最大值'},
                                    {type : 'min', name: '最小值'}
                                ]
                            },
                            markLine : {
                                data : [
                                    {type : 'average', name: '平均值'}
                                ]
                            }
                	        }
                	    ]
                	};
                myChart2.setOption(option2);
                myChart1.setOption(option1);	
                myChart2.showLoading();
                myChart1.showLoading();	
                   
            var months = [];
            var moneys = [];
            
            var names = [];
            var seriess1 = [];
            var m1 = true;
            var seriess2 = [];
            var m2 = true;
            var seriess3 = [];
            var m3 = true;
            var seriess4 = [];
            var m4 = true;
            var seriess5 = [];
            var m5 = true;
            names.push('product');

             $.ajax({
            	 
            	type : "POST",
            	url : "chart1Servlet?inp1="+inp1.value,
            	async : true,
            	dataType : "json",
            	
           		success : function(dataset)
            	{
					$.each(dataset.earnMoney,function (index,item){
						months.push(item.month);
						moneys.push(item.money);
					});
					myChart2.hideLoading();
					myChart2.setOption({
							color: ['#3398DB'],
			           	    tooltip : {
		            	        trigger: 'axis',
		            	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		            	        }
		            	    },
		            	    grid: {
		            	        left: '3%',
		            	        right: '6%',
		            	        bottom: '3%',
		            	        containLabel: true
		            	    },
		            	    xAxis : [
		            	        {
		            	            type : 'category',
		            	            data : months,
		            	            axisTick: {
		            	                alignWithLabel: true
		            	            }
		            	        }
		            	    ],
		            	    yAxis : [
		            	        {
		            	        	name:'元',
		            	            type : 'value'
		            	        }
		            	    ],
		            	    series : [
		            	        {
		            	            name:'总营业额',
		            	            type:'bar',
		            	            barWidth: '60%',
		            	            data:moneys,
		                        markPoint : {
		                            data : [
		                                {type : 'max', name: '最大值'},
		                                {type : 'min', name: '最小值'}
		                            ]
		                        },
		                        markLine : {
		                            data : [
		                                {type : 'average', name: '平均值'}
		                            ]
		                        }
		            	        }
		            	    ]
		            	},true);
					},
					error: function (errorMsg) {
				            //请求失败时执行该函数
				            alert("图表请求数据失败!");
				            myChart2.hideLoading();
				    }          	
            });
             $.ajax({
               	type : "POST",
               	url : "chart2Servlet?inp1="+ inp1.value,
               	async : true,
               	dataType : "json",

              	success : function(dataset)
               	{
     					$.each(dataset.series1,function (index,item){
     						if(m1)
     							{
     								seriess1.push(item.type);
     								m1 = false;
     							}
     						names.push(item.month);
     						seriess1.push(item.money);
     					});
     					$.each(dataset.series2,function (index,item){
     						if(m2)
     							{
     								seriess2.push(item.type);
     								m2 = false;
     							}
     						seriess2.push(item.money);
     					});
     					$.each(dataset.series3,function (index,item){
     						if(m3)
     							{
     								seriess3.push(item.type);
     								m3 = false;
     							}
     						seriess3.push(item.money);
     					});
     					$.each(dataset.series4,function (index,item){
     						if(m4)
     							{
     								seriess4.push(item.type);
     								m4 = false;
     							}
     						seriess4.push(item.money);
     					});
     					$.each(dataset.series5,function (index,item){
     						if(m5)
     							{
     								seriess5.push(item.type);
     								m5 = false;
     							}
     						seriess5.push(item.money);
     					});
     					myChart1.hideLoading();
     					myChart1.setOption({
     			                legend: {},
     			                tooltip: {
     			                    trigger: 'axis',
     			                },
     			                dataset: {
     			                    source: [
     			                      names,
     			                      seriess1,
     			                      seriess2,
     			                      seriess3,
     			                      seriess4,
     			                      seriess5
     			                    ]
     			                },
     			                xAxis: {
     			                	type: 'category'
     			                	},
     			                yAxis: {
     	                        	name:'元',
     	                        	gridIndex: 0},
     			                grid: {top: '55%'},
     			                series: [
     			                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
     			                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
     			                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
     			                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
     			                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
     			                    
     			                    {
     			                        type: 'pie',
     			                        id: 'pie',
     			                        radius: '30%',
     			                        center: ['50%', '25%'],
     			                        label: {
     			                            formatter: '{b}: {@1月} ({d}%)'
     			                        },
     			                        encode: {
     			                            itemName: 'product',
     			                            value:'1月',
     			                            tooltip: '1月',
     			                        },
     			                       itemStyle: {
     			                          emphasis: {
     			                              shadowBlur: 10,
     			                              shadowOffsetX: 0,
     			                              shadowColor: 'rgba(0, 0, 0, 0.8)'
     			                          }
     			                    }
     			                    }
     			                ]
     			            },true);
     					},
     					error: function (errorMsg) {
     				            //请求失败时执行该函数
     				            alert("图表请求数据失败!");
     				            myChart2.hideLoading();
     				    }         	
               });	
             
             
             
            }
           )
           
           $("#subbtn2").click(function(){
               var myChart2 = echarts.init(document.getElementById('scale'));
               var myChart1 = echarts.init(document.getElementById('number'));
                var inp1= document.getElementById('inp1');
                var inp2= document.getElementById('inp2');
                
                option1 = {
                        legend: {},
                        tooltip: {
                            trigger: 'axis',
                        },
                        dataset: {
                            source: [
                            ]
                        },
                        xAxis: {type: 'category'},
                        yAxis: {
                        	name:'元',
                        	gridIndex: 0},
                        grid: {top: '55%'},
                        series: [
                            {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                            {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                            {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                            {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                            {
                                type: 'pie',
                                id: 'pie',
                                radius: '30%',
                                center: ['50%', '25%'],
                                label: {
                                    formatter: '{b}: {@1} ({d}%)'
                                },
                                encode: {
                                    itemName: 'product',
                                    value: '1',
                                    tooltip: '1'
                                }
                            }
                        ]
                    };
                  myChart1.on('updateAxisPointer', function (event) {
                        var xAxisInfo = event.axesInfo[0];
                        if (xAxisInfo) {
                            var dimension = xAxisInfo.value + 1;
                            myChart1.setOption({
                                series: {
                                    id: 'pie',
                                    label: {
                                        formatter: '{b}: {@[' + dimension + ']} ({d}%)'
                                    },
                                    encode: {
                                        value: dimension,
                                        tooltip: dimension
                                    }
                                }
                            });
                        }
                    });
                
                
                
                option2 = {
                	    color: ['#3398DB'],
                	    tooltip : {
                	        trigger: 'axis',
                	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                	        }
                	    },
                	    grid: {
                	        left: '3%',
                	        right: '4%',
                	        bottom: '3%',
                	        containLabel: true
                	    },
                	    xAxis : [
                	        {
                	            type : 'category',
                	            data : [],
                	            axisTick: {
                	                alignWithLabel: true
                	            }
                	        }
                	    ],
                	    yAxis : [
                	        {
                	        	name:'元',
                	            type : 'value'
                	        }
                	    ],
                	    series : [
                	        {
                	            name:'总营业额',
                	            type:'bar',
                	            barWidth: '60%',
                	            data:[],
                            markPoint : {
                                data : [
                                    {type : 'max', name: '最大值'},
                                    {type : 'min', name: '最小值'}
                                ]
                            },
                            markLine : {
                                data : [
                                    {type : 'average', name: '平均值'}
                                ]
                            }
                	        }
                	    ]
                	};
                myChart2.setOption(option2);
                myChart1.setOption(option1);
                myChart2.showLoading();
                myChart1.showLoading();
                
            var periods = [];
            var moneys = [];
            
            var names = [];
            var seriess1 = [];
            var m1 = true;
            var seriess2 = [];
            var m2 = true;
            var seriess3 = [];
            var m3 = true;
            var seriess4 = [];
            var m4 = true;
            var seriess5 = [];
            var m5 = true;
            names.push('product');

             $.ajax({
            	 
            	type : "POST",
            	url : "chart1Servlet?inp1="+inp1.value+"&inp2="+inp2.value,
            	async : true,
            	dataType : "json",
            	
           		success : function(dataset)
            	{
					$.each(dataset.earnMoney,function (index,item){
						periods.push(item.period);
						moneys.push(item.money);
					});
					myChart2.hideLoading();
					myChart2.setOption({
						color: ['#3398DB'],
			           	    tooltip : {
		            	        trigger: 'axis',
		            	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		            	        }
		            	    },
		            	    grid: {
		            	        left: '3%',
		            	        right: '6%',
		            	        bottom: '3%',
		            	        containLabel: true
		            	    },
		            	    xAxis : [
		            	        {
		            	            type : 'category',
		            	            data : periods,
		            	            axisTick: {
		            	                alignWithLabel: true
		            	            }
		            	        }
		            	    ],
		            	    yAxis : [
		            	        {
		            	        	name:'元',
		            	            type : 'value'
		            	        }
		            	    ],
		            	    series : [
		            	        {
		            	            name:'总营业额',
		            	            type:'bar',
		            	            barWidth: '60%',
		            	            data:moneys,
		                        markPoint : {
		                            data : [
		                                {type : 'max', name: '最大值'},
		                                {type : 'min', name: '最小值'}
		                            ]
		                        },
		                        markLine : {
		                            data : [
		                                {type : 'average', name: '平均值'}
		                            ]
		                        }
		            	        }
		            	    ]
		            	},true);
					},
					error: function (errorMsg) {
				            //请求失败时执行该函数
				            alert("图表请求数据失败!");
				            myChart2.hideLoading();
				    }          	
            });
             
             
             $.ajax({
              	  
                	type : "POST",
                	url : "chart2Servlet?inp1="+inp1.value+"&inp2="+inp2.value,
                	async : true,
                	dataType : "json",

               		success : function(dataset)
                	{
      					$.each(dataset.series1,function (index,item){
      						if(m1)
      							{
      								seriess1.push(item.type);
      								m1 = false;
      							}
      						names.push(item.period);
      						seriess1.push(item.money);
      					});
      					$.each(dataset.series2,function (index,item){
      						if(m2)
      							{
      								seriess2.push(item.type);
      								m2 = false;
      							}
      						seriess2.push(item.money);
      					});
      					$.each(dataset.series3,function (index,item){
      						if(m3)
      							{
      								seriess3.push(item.type);
      								m3 = false;
      							}
      						seriess3.push(item.money);
      					});
      					$.each(dataset.series4,function (index,item){
      						if(m4)
      							{
      								seriess4.push(item.type);
      								m4 = false;
      							}
      						seriess4.push(item.money);
      					});
      					$.each(dataset.series5,function (index,item){
      						if(m5)
      							{
      								seriess5.push(item.type);
      								m5 = false;
      							}
      						seriess5.push(item.money);
      					});
      					myChart1.hideLoading();
      					myChart1.setOption({
      			                legend: {},
      			                tooltip: {
      			                    trigger: 'axis',
      			                },
      			                dataset: {
      			                    source: [
      			                      names,
      			                      seriess1,
      			                      seriess2,
      			                      seriess3,
      			                      seriess4,
      			                      seriess5
      			                    ]
      			                },
      			                xAxis: {
      			                	type: 'category'
      			                	},
      			                yAxis: {
      	                        	name:'元',
      	                        	gridIndex: 0},
      			                grid: {top: '55%'},
      			                series: [
      			                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
      			                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
      			                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
      			                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
      			                    {type: 'line', smooth: true, seriesLayoutBy: 'row'},
      			                    
      			                    {
      			                        type: 'pie',
      			                        id: 'pie',
      			                        radius: '30%',
      			                        center: ['50%', '25%'],
      			                        label: {
      			                            formatter: '{b}: {@上旬} ({d}%)'
      			                        },
      			                        encode: {
      			                            itemName: 'product',
      			                            value:'上旬',
      			                            tooltip: '上旬',
      			                        },
      			                      itemStyle: {
      			                        emphasis: {
      			                            shadowBlur: 10,
      			                            shadowOffsetX: 0,
      			                            shadowColor: 'rgba(0, 0, 0, 0.8)'
      			                        }
      			                    }
      			                    }
      			                ]
      			            },true);
      					},
      					error: function (errorMsg) {
      				            //请求失败时执行该函数
      				            alert("图表请求数据失败!");
      				            myChart1.hideLoading();
      				    }         	
                });	
              
            }
           )
    </script>
</body>
</html>