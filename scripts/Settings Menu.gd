# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends Control

func _ready():
	if settings.music_enabled:
		$"../Music/SoundTrack".play()

	if settings.is_mobile:
		$"Name Label".hide()
		$Panel.rect_scale = Vector2(2, 2)

	$"Panel/Sounds Button".pressed = settings.sounds_enabled
	$"Panel/Music Button".pressed = settings.music_enabled
	$"Panel/Shadows Button".pressed = settings.shadow_enabled
	$"Panel/Culling Button".pressed = settings.culling_enabled


func _on_Back_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$".".visible = false
	$"../Main Menu".visible = true


func _on_Shadows_Button_toggled(button_pressed):
	settings.shadow_enabled = button_pressed
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()


func _on_Sounds_Button_toggled(button_pressed):
	settings.sounds_enabled = button_pressed
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()


func _on_Music_Button_toggled(button_pressed):
	settings.music_enabled = button_pressed
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	if settings.music_enabled:
		$"../Music/SoundTrack".play()
	else:
		$"../Music/SoundTrack".stop()


func _on_Culling_Button_toggled(button_pressed):
	settings.culling_enabled = button_pressed
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
