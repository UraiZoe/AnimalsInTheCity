import { BrowserRouter, Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import RedFox from "./pages/RedFox";
import ForestSquirrel from "./pages/ForestSquirrel";
import Bear from "./pages/Bear";

function App() {

  return (
    <>
      <BrowserRouter>
        <Routes>
            <Route index element={<Home />} />
            <Route path="redFox" element={<RedFox />} />
            <Route path="forestSquirrel" element={<ForestSquirrel />} />
            <Route path="bear" element={<Bear />} />
        </Routes>
      </BrowserRouter>
    </>
  )
}

export default App
