<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
                <div class="rev-slider-full">
                    <div class="rev-slider-banner-full  rev-slider-full">
                        <ul id="produtosDestacados">

                            <li data-transition="fade" data-slotamount="7" data-masterspeed="300" >
                                <img src="images/placeholders/slider1/bg1.jpg"  alt="rev-full1" data-fullwidthcentering="on">

                                <div class="tp-caption lft stb stl"
                                     data-x="650"
                                     data-y="93"
                                     data-speed="500"
                                     data-start="500"
                                     data-easing="easeOutExpo"   data-end="6000" data-endspeed="500"><img src="images/placeholders/slider1/imac.png" alt="Image 1"></div>

                                <div class="tp-caption lfb stb stl"
                                     data-x="616"
                                     data-y="194"
                                     data-speed="500"
                                     data-start="700"
                                     data-easing="easeOutExpo"   data-end="6000" data-endspeed="500"><img src="images/placeholders/slider1/ipad.png" alt="Image 1"></div>

                                <div class="tp-caption lfr stb stl"
                                     data-x="751"
                                     data-y="290"
                                     data-speed="1000"
                                     data-start="1000"
                                     data-easing="easeOutExpo"   data-end="6000" data-endspeed="500"><img src="images/placeholders/slider1/iphone.png" alt="Image 1"></div>

                                <div class="tp-caption slider-text-title sft str"
                                     data-x="20"
                                     data-y="150"
                                     data-speed="300"
                                     data-start="800"
                                     data-easing="easeOutCubic" data-end="6000" data-endspeed="500">Acessórios de qualidade</div>


                                <div class="tp-caption slider-text-description sft str"  data-x="20" data-y="200" data-start="1000" data-easing="easeOutBack" data-end="4500" data-endspeed="500">
                                    Nós da Digital A só trabalhamos com produtos da melhor qualidade para seus<br/>
                                    eletrônicos, temos o que há de melhor em capas, películas, fones de ouvido,<br/>
                                    para seus celulares e tablets. Assim como acessórios para seus computadores<br/>
                                    e notebooks.
                                </div>
                                <div class="tp-caption slider-text-description sft str"  data-x="20" data-y="320" data-start="1500" data-easing="easeOutBack"data-end="5000" data-endspeed="500">
                                    <a href="#" class="button btn-flat">Produtos</a>
                                </div>                  

                            </li>


                            <li  data-transition="slideleft" data-slotamount="14">
                                <img src="images/placeholders/slider1/bg2.jpg" alt="Rev Full">

                                <div class="caption sfb" data-x="693" data-y="75" data-speed="700" data-start="0"
                                     data-easing="easeOutBack">
                                    <img src="images/placeholders/slider1/mobile.png" alt=""/>
                                </div>

                                <div class="tp-caption slider-text-title sft str"
                                     data-x="20"
                                     data-y="150"
                                     data-speed="300"
                                     data-start="800"
                                     data-easing="easeOutCubic" data-end="6000" data-endspeed="500">Acessórios para Celulares</div>


                                <div class="tp-caption slider-text-description sft str"  data-x="20" data-y="200" data-start="1000" data-easing="easeOutBack" data-end="4500" data-endspeed="500">
                                    Encontre aqui os ultimos lançamentos em acessórios para o seu celular: capas,<br/> 
                                    películas, fones de ouvido, teclados bluetooth e muito mais.
                                </div>
                                <div class="tp-caption slider-text-description sft str"  data-x="20" data-y="280" data-start="1500" data-easing="easeOutBack"data-end="5000" data-endspeed="500">
                                    <a href="#" class="button btn-flat">Produtos para Celular</a>
                                </div>                

                            </li>

                        </ul>
                        <div class="tp-bannertimer tp-bottom"></div>
                    </div>
                </div></div><!--.top wrapper end -->
                <script>
                
                window.onload = function () {
	                var novaLi = "";
	                novaLi = novaLi + "<li  data-transition=\"slideleft\" data-slotamount=\"14\">";
	                novaLi = novaLi + " <img src=\"images/placeholders/slider1/bg2.jpg\" alt=\"Rev Full\">";
	
	                novaLi = novaLi + " <div class=\"caption sfb\" data-x=\"693\" data-y=\"75\" data-speed=\"700\" data-start=\"0\"";
	                novaLi = novaLi + "    data-easing=\"easeOutBack\">";
	                novaLi = novaLi + "   <img src=\"images/produtos/bigProduto1.jpg\" alt=\"\"/>";
	                novaLi = novaLi + " </div>";
	
	                novaLi = novaLi + " <div class=\"tp-caption slider-text-title sft str\"";
	                novaLi = novaLi + "    data-x=\"20\"";
	                novaLi = novaLi + "    data-y=\"150\"";
	                novaLi = novaLi + "    data-speed=\"300\"";
	                novaLi = novaLi + "    data-start=\"800\"";
	                novaLi = novaLi + "    data-easing=\"easeOutCubic\" data-end=\"6000\" data-endspeed=\"500\">Acessórios para Celulares Dinamicos</div>";
	
	                novaLi = novaLi + " <div class=\"tp-caption slider-text-description sft str\"  data-x=\"20\" data-y=\"200\" data-start=\"1000\" data-easing=\"easeOutBack\" data-end=\"4500\" data-endspeed=\"500\">";
	                novaLi = novaLi + "   Capinhas para celular multimarcas,<br/> ";
	                novaLi = novaLi + "   para várias versões de android. Apenas R$10,00.";
	                novaLi = novaLi + " </div>";
	
	                novaLi = novaLi + " <div class=\"tp-caption slider-text-description sft str\"  data-x=\"20\" data-y=\"280\" data-start=\"1500\" data-easing=\"easeOutBack\"data-end=\"5000\" data-endspeed=\"500\">";
	                novaLi = novaLi + "   <a href=\"#\" class=\"button btn-flat\">Capa para celular</a>";
	                novaLi = novaLi + " </div>";
	                novaLi = novaLi + "</li>";
	                 
	                $("#produtosDestacados").append(novaLi);
                };
                </script>