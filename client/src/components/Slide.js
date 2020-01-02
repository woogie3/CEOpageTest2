import React from 'react';
import {Slide} from 'react-slideshow-image';
import img1 from '../imges/연극1.jpg';
import img2 from '../imges/연극2.jpg';
import img3 from '../imges/연극7.jpg';
import '../css/Slide.css'

const properties = {
   duration: 5000,
   transtionDuration : 500,
   infinite: true,
   indicators: true,
   arrows: true
  }

const slideshow = () =>{
    return (
        <div className="containerSlide">
            <Slide {...properties}>
                <div className="each-slide">
                    <div>
                        <img src = {img1} alt ="img1"/>
                    </div>
                </div>
                <div className="each-slide">
                    <div>
                        <img src = {img2} alt ="img2"/>
                    </div>
                </div>
                <div className="each-slide">
                    <div>
                        <img src = {img3} alt ="img3"/>
                    </div>
                </div>
            </Slide>
        </div>
    )
}

export default slideshow;