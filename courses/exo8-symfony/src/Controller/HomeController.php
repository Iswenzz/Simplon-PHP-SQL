<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Class HomeController
 * @package App\Controller
 * @Route("/home")
 */
class HomeController extends AbstractController
{
	/**
	 * @Route("")
	 */
	public function index()
	{
		return $this->render("home/home.html.twig");
	}

	/**
	 * @Route("/name/{name}")
	 */
	public function name(string $name)
	{
		return $this->render("home/home.html.twig", [
			"name" => $name
		]);
	}

	/**
	 * @Route("/sum/{a}/{b}",
	 *	 requirements={"code"="\d+"})
	 */
	public function sum(int $a, int $b)
	{
		return $this->json([
			"result" => $a + $b
		]);
	}
}
