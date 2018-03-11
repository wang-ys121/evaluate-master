<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="js/JsonExportExcel.js"></script>
<!-- 创建图表容器 -->
    <div id="c-person"></div>
    <script>    
    var personlist = [];    
    $.ajax({
    	url:"showresult/person",
    	async:true,
    	success:function(result){
    		console.info(result);
    		personlist = result;
    		var data = eval("(" + result + ")");
    		/* const data = [
    	        { genre: 'Sports', sold: 275 },
    	        { genre: 'Strategy', sold: 115 },
    	        { genre: 'Action', sold: 120 },
    	        { genre: 'Shooter', sold: 350 },
    	        { genre: 'Other', sold: 150 }
    	      ]; // G2 对数据源格式的要求，仅仅是 JSON 数组，数组的每个元素是一个标准 JSON 对象。 */
    	      // Step 1: 创建 Chart 对象
    	      const chart = new G2.Chart({
    	        container: 'c-person', // 指定图表容器 ID
    	        width : 1000, // 指定图表宽度
    	        height : 300 // 指定图表高度
    	      });
    	      // Step 2: 载入数据源
    	      chart.source(data);
    	      // Step 3：创建图形语法，绘制柱状图，由 genre 和 sold 两个属性决定图形位置，genre 映射至 x 轴，sold 映射至 y 轴
    	      chart.interval().position('genre*sold').color('genre')
    	      // Step 4: 渲染图表
    	      chart.render();

		}
    });
      
    </script>
    
    
    <button type="button" id="down2">导出excel</button> 
    
    <script type="text/javascript">
		
    $("#down2").click(function()
    {
    	downPerson();
    });  
		
	function downPerson()
	{				
		var option2={};

		option2.fileName = '个人投票结果';
		option2.datas=[
		  {				
		    sheetData:eval('(' + personlist + ')'),				          
		    sheetName:'sheet1',
		    sheetFilter:['genre','sold'],
		    sheetHeader:['姓名','分数']
		  }
		];
		var toExcel2=new ExportJsonExcel(option2);
		toExcel2.saveExcel();
	}
    
	</script>
    
    