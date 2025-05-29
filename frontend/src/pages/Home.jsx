import { useState } from 'react'
import 'tachyons'
import 'bootstrap/dist/css/bootstrap.css';
import Species from '../components/species';
import './Home.css'

function Home() {

  return (
    <>
      <div>
        <Species></Species>
      </div>
    </>
  )
}

export default Home