<?php

namespace App\Controller;

use App\Entity\Video;
use App\Form\VideoType;
use Knp\Component\Pager\PaginatorInterface;
use App\Model\SearchData;
use App\Form\SearchType;
use App\Repository\VideoRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;

#[Route('/')]
class VideoController extends AbstractController
{
    #[Route('/', name: 'app_home', methods: ['GET'])]
    public function index(VideoRepository $videoRepository, PaginatorInterface $paginatorInterface, Request $request): Response
    {
        if ($this->getUser()){
            if (!$this->getUser()->isVerified()){
                $this->addFlash('info', 'Votre adresse e-mail n\'est pas vérifiée.');
            }  
        }
        $pagination=$paginatorInterface->paginate(
            $videoRepository->paginationQuery(),
            $request->query->get('page',1),
            9


        );
        $search = false;

        //barre de rechercher
        $searchData = new SearchData();
        $form = $this->createForm(SearchType::class, $searchData);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $searchData->page = $request->query->getInt('page', 1);
            $pagination = $paginatorInterface->paginate(
                $videoRepository->findBySearch($searchData),
                $request->query->get('page', 1),
                6
            );
            $search = true;
            return $this->render('video/index.html.twig', [
                'form' => $form,
                'pagination' => $pagination,
                'search' => $search,
                'searchData' => $searchData->q,
               
            ]);
        }
        
        return $this->render('video/index.html.twig', [
            'form' => $form->createView(),
            'pagination' => $pagination,
            'search' => $search
            
        ]);
    }

    #[Route('/video/create', name: 'app_video_create', methods: ['GET', 'POST'])]
    public function new(Request $request, VideoRepository $videoRepository,EntityManagerInterface $em): Response
    {

        if ($this->getUser()){
            if ($this->getUser()->isVerified() == false) {
                $this->addFlash('error', 'Vous devez confirmer votre email pour créer cette vidéo!');
                return $this->redirectToRoute('app_home');
            } 
        }else{
            $this->addFlash('error', 'Vous devez vous connecter pour publier cette vidéo!');
            return $this->redirectToRoute('app_login');
        }
        $video = new Video();
        $form = $this->createForm(VideoType::class, $video);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // $videoRepository->save($video, true);
            $video->setUser($this->getUser());
            $em->persist($video);
            $em->flush();
            $this->addFlash('Success', 'Video successfully created!');

            return $this->redirectToRoute('app_home', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('video/new.html.twig', [
            'video' => $video,
            'form' => $form,
        ]);
    }

    #[Route('/video/{id}', name: 'app_video_show', methods: ['GET'])]
    public function show(Video $video): Response
    {
       
        return $this->render('video/show.html.twig', [
            'video' => $video,
        ]);
    }

    #[Route('/video/{id}/edit', name: 'app_video_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Video $video, VideoRepository $videoRepository): Response
    {
        if ($this->getUser()) {
            if ($this->getUser()->isVerified() == false) {
                $this->addFlash('error', 'Vous devez confirmer votre email pour éditer cette vidéo !');
                return $this->redirectToRoute('app_home');
            } else if ($video->getUser()->getEmail() !== $this->getUser()->getEmail()) {
                $this->addFlash('error', 'Vous devez être l\'utilisateur ' . $video->getUser()->getFirstname() . ' pour éditer cette vidéo !');
                return $this->redirectToRoute('app_home');
            }
        } else {
            $this->addFlash('error', 'Vous devez vous connecter pour éditer cette vidéo!');
            return $this->redirectToRoute('app_login');
        }
        $form = $this->createForm(VideoType::class, $video);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $videoRepository->save($video, true);

            return $this->redirectToRoute('app_home', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('video/edit.html.twig', [
            'video' => $video,
            'form' => $form,
        ]);
    }

    #[Route('/video/{id}', name: 'app_video_delete', methods: ['POST'])]
    public function delete(Request $request, Video $video, VideoRepository $videoRepository): Response
    {
        if ($this->getUser()) {
            if ($this->getUser()->isVerified() == false) {
                $this->addFlash('error', 'Vous devez confirmer votre email pour supprimer cette vidéo!');
                return $this->redirectToRoute('app_home');
            } else if ($video->getUser()->getEmail() !== $this->getUser()->getEmail()) {
                $this->addFlash('error', 'Vous devez être l\' utilisateur ' . $video->getUser()->getFirstname() . ' pour supprimer cette vidéo!');
                return $this->redirectToRoute('app_home');
            }
        } else {
            $this->addFlash('error', 'Vous devez être connecté pour supprimer cette vidéo!');
            return $this->redirectToRoute('app_login');
        }
        if ($this->isCsrfTokenValid('delete'.$video->getId(), $request->request->get('_token'))) {
            $videoRepository->remove($video, true);

        }
        $this->addFlash('info', 'Vidéo supprimée avec succès!');
        return $this->redirectToRoute('app_home', [], Response::HTTP_SEE_OTHER);
    }
}
