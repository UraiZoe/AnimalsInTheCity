import { useState } from 'react'
import axios from "axios";
import Table from 'react-bootstrap/Table';

function species() {
    const [animal, setAnimal] = useState([]);

    axios.get("http://localhost:3001/species")
        .then((response) => {
            setAnimal(response.data);
        })
        .catch((err) => {
            Console.log(err);
        });
    return (
        <>

            <Table striped bordered hover>
                <thead>
                    <tr>
                        <th>Latín neve</th>
                        <th>Magyar neve</th>
                        <th>Állat</th>
                        <th>Faja</th>
                    </tr>
                </thead>
                <tbody>
                    {animal.map((x) => (
                        <tr>
                            <td>{x.latin_name}</td>
                            <td>{x.hungarian_name}</td>
                            <td>{x.family}</td>
                            <td>{x.state}</td>
                        </tr>
                    ))}
                </tbody>
            </Table>
        </>
    )
}

export default species